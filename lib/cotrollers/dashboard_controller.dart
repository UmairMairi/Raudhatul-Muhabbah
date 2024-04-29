import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/base_controller.dart';
import 'package:raudhatul_muhabbah/extentions/map_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/response_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
import 'package:raudhatul_muhabbah/models/benefits_model.dart';
import 'package:raudhatul_muhabbah/models/latest_achievements_model.dart';
import 'package:raudhatul_muhabbah/models/profile_details.dart';
import 'package:raudhatul_muhabbah/network/api_constants.dart';
import 'package:raudhatul_muhabbah/network/http_services.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/singlton.dart';

class DashboardController extends BaseController {
  RxBool isProfileLoading = false.obs;
  var profileModel = Rxn<ProfileDetails?>();

  Future getHomeData()async{
    var benefitsModel = await getBenefits();
    var totalAchievements = await getTotalAchievements();
  }

  var benefitsModel = Rxn<List<BenefitsModel>?>();
  RxBool isBenefitsLoading = false.obs;

  Future<List<BenefitsModel>?> getBenefits() async {
    isBenefitsLoading.value = true;
    try {
      var response = await HttpServices.getJson(url: ApiConstants.getBenefits, token: Singleton.token);
      if (response.isSuccessful()) {
        benefitsModel.value = benefitsModelFromJson(response.body);
        isBenefitsLoading.value = false;
        return benefitsModel.value;
      } else {
        "${response.body.toJson()?.getValueOfKey("message") ?? Constants.somethingWrong.tr}".showSnackbar();
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
      var response = await HttpServices.getJson(url: ApiConstants.totalAchievements, token: Singleton.token);
      if (response.isSuccessful()) {
        totalAchievements.value =  response.body.toJson()?.getValueOfKey("total_achievement_value") ?? 0;
        return totalAchievements.value;
      } else {
        "${response.body.toJson()?.getValueOfKey("message") ?? Constants.somethingWrong.tr}".showSnackbar();
      }
      return null;
    } catch (e) {
      'msg_something_went_wrong'.tr.showSnackbar();
      return null;
    }
  }


  Future<ProfileDetails?> getProfileDetails({required String id}) async {
    isProfileLoading.value = true;
    profileModel.value = null;
    try {
      var response = await HttpServices.getJson(url: "${ApiConstants.getProfileDetails}$id/", token: Singleton.token);
      if (response.isSuccessful()) {
        profileModel.value = profileDetailsFromJson(response.body);
      } else {
        "${response.body.toJson()?.getValueOfKey("message") ?? Constants.somethingWrong.tr}".showSnackbar();
      }
      isProfileLoading.value = false;
      return profileModel.value;
    } catch (e) {
      isProfileLoading.value = false;
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }


  Future<Object?> updateProfile({
    required String id,
    required String fName,
    required String lastName,
    required String email,
    required String phone,
    required String address,
  }) async {
    isLoading.value = true;

    var body = {
      "first_name": fName,
      "last_name": lastName,
      "email": email,
      "phone_no": phone,
      "p_address": address,
      "profile": {"phone_no": phone, "p_address": address}
    };
    try {
      var response = await HttpServices.putJson(
          url: "${ApiConstants.updateProfile}$id/", token: Singleton.token,body: body);
      if (response.isSuccessful()) {
        profileModel.value = profileDetailsFromJson(response.body);
        isLoading.value = false;
        Get.back();
        return profileModel.value;
      } else {
        "${response.body.toJson()?.getValueOfKey("message") ?? Constants.somethingWrong.tr}".showSnackbar();
      }
      isLoading.value = false;
      return profileModel.value;
    } catch (e) {
      isLoading.value = false;
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
        "${response.body.toJson()?.getValueOfKey("message") ?? Constants.somethingWrong.tr}"
            .showSnackbar();
      }
      isLatestAchievementsLoading.value = false;
      return model.value;
    } catch (e) {
      'msg_something_went_wrong'.tr.showSnackbar();
      isLatestAchievementsLoading.value = false;
      return null;
    }
  }
}
