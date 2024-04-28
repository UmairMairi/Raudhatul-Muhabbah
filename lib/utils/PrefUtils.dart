import 'package:shared_preferences/shared_preferences.dart';

class MyPrefUtils {
  static String tokenKey = "tokenKey";
  static String loginModel = "loginModel";
  static String signupModel = "loginModel";

  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static Future<void> putString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<void> putBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static Future<void> clearCaches() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
