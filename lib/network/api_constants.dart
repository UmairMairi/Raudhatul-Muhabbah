class ApiConstants {
  static const String baseUrlLive = "https://lobster-app-5yijn.ondigitalocean.app/swagger/";
  static const String baseUrlLocal = "http://127.0.0.1/";
  static const String BASE_URL = (false) ? baseUrlLocal : baseUrlLive;
  static const String register = "${BASE_URL}base/system_user_registeration/";
  static const String login = "${BASE_URL}auth/token/";
  static const String getProfileDetails = "${BASE_URL}base/my";
}
