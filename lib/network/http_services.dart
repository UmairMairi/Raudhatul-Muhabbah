import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as tr;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:raudhatul_muhabbah/utils/singlton.dart';

class HttpServices {
  static var internetMsg = {
    'success': false,
    'message': 'No internet connection!'.tr
  };

  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static Future<Response> getJson(
      {Map<String, dynamic>? body, required String url, String? token}) async {
    if (!(await hasNetwork())) {
      return http.Response(json.encode(internetMsg), 400);
    }
    Map<String, String> headers;

    token = Singleton.token;

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers["Authorization"] = 'Token $token';
    }

    if (kDebugMode) {
      print(
          "Url------------------------>$url\nrequest headers------------------------>$headers");
    }
    if (body != null) {
      final queryParams = Uri(queryParameters: body).query;
      url += (url.contains('?') ? '&' : '?') + queryParams;
    }
    var request = http.Request('GET', Uri.parse(url));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

  static Future<http.Response> postJson({
    String? token,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    required String url,
    bool userAgentRequired = false,
  }) async {
    if (!(await hasNetwork())) {
      return http.Response(json.encode(internetMsg), 400);
    }

    token = Singleton.token;
    Map<String, String> headers;
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers["Authorization"] = 'Bearer $token';
    }
    if (kDebugMode) {
      print("Url------------------------>$url");
      print("Request headers------------------------>$headers");
      print("Body------------------------>$body");
    }
    if (queryParams != null) {
      final uri = Uri.parse(url).replace(queryParameters: queryParams);
      url = uri.toString();
    }

    var request = http.Request("POST", Uri.parse(url));
    if (body != null) {
      request.body = jsonEncode(body);
    }

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

  static Future<http.Response> postMultiPartJson({
    String? token,
    Map<String, dynamic>? queryParams,
    Map<String, String>? body,
    Map<String, dynamic>? images,
    required String url,
  }) async {
    if (!(await hasNetwork())) {
      return http.Response(json.encode(internetMsg), 400);
    }

    token = Singleton.token;
    Map<String, String> headers;
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers["Authorization"] = 'Bearer $token';
    }

    if (kDebugMode) {
      print(
          "Url------------------------>$url\nRequest headers------------------------>$headers\nBody------------------------>$body");
    }
    if (queryParams != null) {
      final uri = Uri.parse(url).replace(queryParameters: queryParams);
      url = uri.toString();
    }

    var request = http.MultipartRequest("POST", Uri.parse(url));
    if (body != null) {
      request.fields.addAll(body);
    }
    if (images != null) {
      images.forEach((key, value) async {
        request.files.add(await http.MultipartFile.fromPath(key, value));
      });
    }

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

  static Future<Response> putJson({
    String? token,
    Map<String, dynamic>? body,
    required String url,
  }) async {
    Map<String, String> headers;
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers["Authorization"] = 'Bearer $token';
    }

    var request = http.Request("PUT", Uri.parse(url));
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

  static Future<Response> deleteJson({
    String? token,
    required String url,
  }) async {
    Map<String, String> headers;
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    if (token != null) {
      headers["Authorization"] = 'Bearer $token';
    }

    var request = http.Request("DELETE", Uri.parse(url));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

  static Future<http.Response> putMultiPartJson(
      {String? token,
      Map<String, String>? body,
      Map<String, String>? filePath,
      required String url}) async {
    Map<String, String> headers;
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    if (token != null) {
      headers["Authorization"] = 'Bearer $token';
    }
    var request = http.MultipartRequest("PUT", Uri.parse(url));
    if (body != null) {
      request.fields.addAll(body);
    }
    if (filePath != null) {
      filePath.forEach((key, value) async {
        request.files.add(await http.MultipartFile.fromPath(key, value));
      });
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

  static Future<http.Response> patchJson(
      {Map<String, dynamic>? body, required String url, String? token}) async {
    Map<String, String> headers;
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    if (token != null) {
      headers["Authorization"] = 'Bearer $token';
    }
    var request = http.Request('PATCH', Uri.parse(url));
    request.headers.addAll(headers);
    if (body != null) {
      request.body = jsonEncode(body);
    }
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }
}
