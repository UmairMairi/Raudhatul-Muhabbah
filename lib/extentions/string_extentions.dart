import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';
import 'package:url_launcher/url_launcher.dart';

extension DoubleExtention on String {
  Future<void> launch() async {
    if (await canLaunchUrl(Uri.parse(this))){
      if (!await launchUrl(Uri.parse(this))) {
        if (kDebugMode) {
          print("TAG---------------> Unable to launch URL $this");
        }
      }
    }else{
      if (kDebugMode) {
        print("TAG---------------> Unable to launch URL $this");
      }
    }
  }
}

extension NullableStringExtention on String? {

  bool isValidEmail() {
    if(this == null) return false;
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(this!);
  }

  String? removePlus() {
    if(this == null) return null;

    try {
      var data =  this?.replaceFirst("+", "");
      return data;
    } catch (e) {
      if (kDebugMode) {
        print("Error parsing date: $e");
      }
    }
    return null;
  }

  String? maskString() {
    if(this == null) return null;
    if (this!.length <= 5) return this!;
    String masked = this!.substring(this!.length - 5).padLeft(this!.length, '*');
    return masked;
  }

  printSuccess() {
    if (kDebugMode) {
      log("\uD83C\uDF89 \uD83C\uDF89 \uD83C\uDF89 🙌 Response success Type: $this 🙌 \uD83C\uDF89 \uD83C\uDF89 \uD83C\uDF89");
    }
  }

  printFailure() {
    if (kDebugMode) {
      log("❌ ☠️ ☠️ Response Failed Type: $this ☠️ ☠️ ❌");
    }
  }

  Map? getParamsFromUrl(){
    if(this == null) return null;
    Uri uri = Uri.parse(this!);
    Map<String, String> queryParams = uri.queryParameters;
    return queryParams;
  }

  Map<String, dynamic>? toJson(){
    if(this == null) return null;
    try{
      return json.decode(this!);
    } catch(e){
      return null;
    }
  }

  showSnackbar({
    Color? bgColor,
    IconData? icon,
    Color? iconColor,
    TextAlign? textAlign,
    SnackPosition? snackPosition,
    int? seconds,
    Color? textColor,
    Color? backgroundColor,
    Color? borderColor,
    Widget? image,
    bool isSuccess = false,
    trailingImage
  }) {
    Get.snackbar(
      "",
      "",
      padding: EdgeInsets.zero,
      duration: seconds != null ? Duration(seconds: seconds) : const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 8,
      titleText: const Text("", style: TextStyle(height: 0),),
      messageText: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 10, top: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if(!isSuccess)
              image??const Icon(
                Icons.info,
                color: MyColors.orangeRedColor,
                size: 20,
              ),
            if(!isSuccess) const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                this ?? Constants.somethingWrong.tr,
                textAlign: TextAlign.start,
                style: MyTextStyle.normal.copyWith(color: (isSuccess) ? MyColors.snackbarSuccessBorder:MyColors.blackColor, height: 1.18),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            if(!isSuccess) trailingImage ?? Icon(
              Icons.clear,
              color: iconColor ?? MyColors.orangeRedColor,
              size: 15,
            ),
          ],
        ),
      ),
      backgroundColor: (){
        if(isSuccess) {
          return MyColors.snackbarSuccessBackground;
        }
        else {
          return backgroundColor ?? MyColors.peachColor;
        }
      }(),
      colorText: textColor ?? MyColors.whiteColor,
      borderWidth: 1,
      borderColor:(){
        if(isSuccess) {
          return MyColors.snackbarSuccessBorder;
        }
        else {
          return borderColor??MyColors.lightPinkColor;
        }
      }(),
      snackPosition: snackPosition ?? SnackPosition.TOP,
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
    );
  }


  String? shortenText({String overflowText = "", int maxLength = 100}) {
    if(this == null) return null;
    if (this!.length <= maxLength) {
      return this;
    } else {
      var shortenedText = this?.substring(0, maxLength);
      return '$shortenedText$overflowText';
    }
  }

  DateTime? pdtTimeToDateTime() {
    if (this == null) return null;
    try {
      // Input time string
      String inputTime = this!;

      // Extract time and timezone abbreviation
      var regExp = RegExp(r"(\d{2}):(\d{2}) \((\w{3})\)");
      var match = regExp.firstMatch(inputTime);

      if (match != null && match.groupCount == 3) {
        var hours = int.parse(match.group(1)!);
        var minutes = int.parse(match.group(2)!);
        var timezoneAbbr = match.group(3);

        // Get current date
        var now = DateTime.now();

        // Create a DateTime object for today with the specified time
        var todayWithTime = DateTime(now.year, now.month, now.day, hours, minutes);

        // Format the DateTime object with timezone abbreviation
        // var formattedTime = DateFormat("HH:mm (zzz)").format(todayWithTime);
        print(todayWithTime); // Output: 05:40 (PDT)
        return todayWithTime;
      }
      print("Invalid input time format");
      return null;
    } catch (e) {
      if (kDebugMode) {
        print("Exception---------------->$e");
      }
      return null;
    }
  }

  static String generateKenyanPhoneNumber() {
    final random = math.Random();
    String countryCode = '+254';
    String prefix = random.nextBool() ? '7' : '1';
    String number = List.generate(8, (_) => random.nextInt(10)).join();
    return '$countryCode$prefix$number';
  }

}
