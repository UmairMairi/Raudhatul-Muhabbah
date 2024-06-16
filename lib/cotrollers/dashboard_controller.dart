import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/base_controller.dart';
import 'package:raudhatul_muhabbah/extentions/map_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/response_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
import 'package:raudhatul_muhabbah/models/benefits_model.dart';
import 'package:raudhatul_muhabbah/models/highest_achievement_model.dart';
import 'package:raudhatul_muhabbah/models/latest_achievements_model.dart';
import 'package:raudhatul_muhabbah/models/latest_targets_model.dart';
import 'package:raudhatul_muhabbah/models/prayer_time_model.dart';
import 'package:raudhatul_muhabbah/models/profile_details.dart';
import 'package:raudhatul_muhabbah/models/submit_targets_model.dart';
import 'package:raudhatul_muhabbah/network/api_constants.dart';
import 'package:raudhatul_muhabbah/network/http_services.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/notification_utils.dart';
import 'package:raudhatul_muhabbah/utils/singlton.dart';

class DashboardController extends BaseController {
  RxBool isProfileLoading = false.obs;
  var profileModel = Rxn<ProfileDetails?>();

  Future getHomeData() async {
    var benefitsModel = await getBenefits();
    var totalAchievements = await getTotalAchievements();
  }

  RxBool isHighestAchievementLoading = false.obs;
  var highestAchieverModel = Rxn<HighestAchieverModel?>();

  Future<dynamic> getHighestAchievement() async {
    isHighestAchievementLoading.value = true;
    try {
      var response = await HttpServices.getJson(
        url: ApiConstants.highestAchiever, token: Singleton.token,);
      if (response.isSuccessful()) {
        if (response.body != "[]") {
          highestAchieverModel.value =
              highestAchieverModelFromJson(response.body);
        }
        isHighestAchievementLoading.value = false;
        return highestAchieverModel.value;
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ??
            Constants.somethingWrong.tr}".showSnackbar();
      }
      isHighestAchievementLoading.value = false;
      return null;
    } catch (e) {
      isHighestAchievementLoading.value = false;
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }


  RxBool isSubmitAchievementLoading = false.obs;

  Future<SubmitTargetModel?> submitAchievement(
      {required int targetId, required String achievementValue}) async {
    isSubmitAchievementLoading.value = true;
    try {
      var body = {"achievement_value": achievementValue, "target": targetId};
      var response = await HttpServices.postJson(
          url: ApiConstants.submitAchievement,
          token: Singleton.token,
          body: body);
      if (response.isSuccessful()) {
        var model = submitTargetModelFromJson(response.body);
        isSubmitAchievementLoading.value = false;
        return model;
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ??
            Constants.somethingWrong.tr}".showSnackbar();
      }
      isSubmitAchievementLoading.value = false;
      return null;
    } catch (e) {
      isSubmitAchievementLoading.value = false;
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }

  RxBool isLatestTargetLoading = false.obs;
  var latestTargetModel = Rxn<List<LatestTargetsModel>>();

  Future<List<LatestTargetsModel>?> getLatestTargets() async {
    isLatestTargetLoading.value = true;
    latestTargetModel.value = null;
    try {
      var response = await HttpServices.getJson(
          url: ApiConstants.latestTarget, token: Singleton.token);
      if (response.isSuccessful()) {
        latestTargetModel.value =
            latestTargetsModelFromJson(response.body).where((element) => element
                .targetValue != null).toList();
        isLatestTargetLoading.value = false;
        return latestTargetModel.value;
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ??
            Constants.somethingWrong.tr}".showSnackbar();
      }
      isLatestTargetLoading.value = false;
      return null;
    } catch (e) {
      isLatestTargetLoading.value = false;
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }


  RxBool isTargetLoading = false.obs;

  Future<SubmitTargetModel?> submitTarget({required String targets}) async {
    isTargetLoading.value = true;
    try {
      var body = {"target_value": targets};
      var response = await HttpServices.postJson(
          url: ApiConstants.submitTarget, token: Singleton.token, body: body);
      if (response.isSuccessful()) {
        var model = submitTargetModelFromJson(response.body);
        isTargetLoading.value = false;
        return model;
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ??
            Constants.somethingWrong.tr}"
            .showSnackbar();
      }
      isTargetLoading.value = false;
      return null;
    } catch (e) {
      isTargetLoading.value = false;
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }

  var benefitsModel = Rxn<List<BenefitsModel>?>();
  RxBool isBenefitsLoading = false.obs;

  Future<List<BenefitsModel>?> getBenefits() async {
    isBenefitsLoading.value = true;
    try {
      var response = await HttpServices.getJson(
          url: ApiConstants.getBenefits, token: Singleton.token);
      if (response.isSuccessful()) {
        benefitsModel.value = benefitsModelFromJson(response.body);
        isBenefitsLoading.value = false;
        return benefitsModel.value;
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ??
            Constants.somethingWrong.tr}".showSnackbar();
      }
      isBenefitsLoading.value = false;
      return null;
    } catch (e) {
      isBenefitsLoading.value = false;
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }

  var totalAchievements = Rxn<int?>();

  Future<int?> getTotalAchievements() async {
    try {
      var response = await HttpServices.getJson(
          url: ApiConstants.totalAchievements, token: Singleton.token);
      if (response.isSuccessful()) {
        totalAchievements.value =
            response.body.toJson()?.getValueOfKey("total_achievement_value") ??
                0;
        return totalAchievements.value;
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ??
            Constants.somethingWrong.tr}"
            .showSnackbar();
      }
      return null;
    } catch (e) {
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }

  Future<ProfileDetails?> getProfileDetails({required String id}) async {
    isProfileLoading.value = true;
    profileModel.value = null;
    try {
      var response = await HttpServices.getJson(
          url: "${ApiConstants.getProfileDetails}$id/", token: Singleton.token);
      if (response.isSuccessful()) {
        profileModel.value = profileDetailsFromJson(response.body);
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ??
            Constants.somethingWrong.tr}".showSnackbar();
      }
      isProfileLoading.value = false;
      return profileModel.value;
    } catch (e) {
      isProfileLoading.value = false;
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }

  RxBool isUpdateProfileLoading = false.obs;

  Future<Object?> updateProfile({
    required String id,
    required String fName,
    required String lastName,
    required String email,
    required String phone,
    required String address,
  }) async {
    isUpdateProfileLoading.value = true;

    var body = {
      "first_name": fName,
      "last_name": lastName,
      "email": email,
      "phone_no": phone,
      "p_address": address,
      "profile": {
        "phone_no": phone,
        "p_address": address,
        "device_token": NotificationUtils.firebaseToken
      }
    };
    try {
      var response = await HttpServices.putJson(
          url: "${ApiConstants.updateProfile}$id/",
          token: Singleton.token,
          body: body);
      if (response.isSuccessful()) {
        profileModel.value = profileDetailsFromJson(response.body);
        isUpdateProfileLoading.value = false;
        Get.back();
        return profileModel.value;
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ??
            Constants.somethingWrong.tr}".showSnackbar();
      }
      isUpdateProfileLoading.value = false;
      return profileModel.value;
    } catch (e) {
      isUpdateProfileLoading.value = false;
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }

  RxBool isLatestAchievementsLoading = false.obs;
  var model = Rxn<List<LatestAchievementModel>?>();

  Future<List<LatestAchievementModel>?> getLatestAchievements() async {
    isLatestAchievementsLoading.value = true;
    model.value = null;
    try {
      var response = await HttpServices.getJson(
          url: ApiConstants.latestAchievement, token: Singleton.token);
      if (response.isSuccessful()) {
        model.value = latestAchievementModelFromJson(response.body);
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ??
            Constants.somethingWrong.tr}".showSnackbar();
      }
      isLatestAchievementsLoading.value = false;
      return model.value;
    } catch (e) {
      Constants.somethingWrong.tr.showSnackbar();
      isLatestAchievementsLoading.value = false;
      return null;
    }
  }

  var prayerTimeModel = Rxn<PrayerTimeModel>();
  RxBool prayerTimeLoading = false.obs;
  Future<PrayerTimeModel?> getPrayerTimes({
    num methods = 2,
  }) async {
    try {
      prayerTimeLoading.value = true;
      num lat = 0.0;
      num lng = 0.0;

      var position = await _determinePosition();
      lat = position.latitude;
      lng = position.longitude;
      var body = {
        "latitude": "$lat",
        "longitude": "$lng",
        "method": "$methods"
      };
      var response = await HttpServices.getJson(url: ApiConstants.getPrayerTimes, body: body, token: Singleton.token);
      if (response.isSuccessful()) {
        prayerTimeModel.value = prayerTimeModelFromJson(response.body);
        prayerTimeLoading.value = false;
        return prayerTimeModel.value;
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ?? Constants.somethingWrong.tr}".showSnackbar();
      }
      prayerTimeLoading.value = false;
      return null;
    } catch (e) {
      Constants.somethingWrong.tr.showSnackbar();
      prayerTimeLoading.value = false;
      return null;
    }
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
