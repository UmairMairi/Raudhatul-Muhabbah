class ApiConstants {
  static const String baseUrlLive = "https://lobster-app-5yijn.ondigitalocean.app/";
  static const String baseUrlLocal = "http://127.0.0.1/";
  static const String BASE_URL = (false) ? baseUrlLocal : baseUrlLive;

  static const String register = "${BASE_URL}base/system_user_registeration/";
  static const String login = "${BASE_URL}auth/token/";
  // static const String getProfileDetails = "${BASE_URL}base/my";
  static const String getProfileDetails = "${BASE_URL}base/system_user_registeration/";
  static const String updateProfile = "${BASE_URL}base/system_user_registeration/";
  static const String getBenefits = "${BASE_URL}swala/benefits/";
  static const String toggleTargets = "${BASE_URL}swala/toggleTarget/";
  static const String toggleAchievement = "${BASE_URL}swala/toggleAchievement/";
  static const String highestAchiever = "${BASE_URL}swala/highest_achiever/";
  static const String totalAchievements = "${BASE_URL}swala/totalAchievements/";

  static const String latestAchievement = "${BASE_URL}swala/latestAchievement/";
  static const String resetPassword = "${BASE_URL}auth/password/";
}