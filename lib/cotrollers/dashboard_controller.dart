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


  Future<ProfileDetails?> getProfileDetails() async {
    try {
      var response = await HttpServices.getJson(url: ApiConstants.getProfileDetails,token: Singleton.token);
      if (response.isSuccessful()) {
        return profileDetailsFromJson(response.body);
      } else {
        "${response.body.toJson()?.getValueOfKey("message") ?? Constants.somethingWrong.tr}".showSnackbar();
      }
      return null;
    } catch (e) {
      'msg_something_went_wrong'.tr.showSnackbar();
      return null;
    }
  }

  Future<List<BenefitsModel>?> getBenefits() async {
    try {
      var response = await HttpServices.getJson(url: ApiConstants.getBenefits,token: Singleton.token);
      if (response.isSuccessful()) {
        return benefitsModelFromJson(response.body);
      } else {
        "${response.body.toJson()?.getValueOfKey("message") ?? Constants.somethingWrong.tr}".showSnackbar();
      }
      return null;
    } catch (e) {
      'msg_something_went_wrong'.tr.showSnackbar();
      return null;
    }
  }

  Future<List<BenefitsModel>?> getTotalAchievements() async {
    try {
      var response = await HttpServices.getJson(url: ApiConstants.getBenefits,token: Singleton.token);
      if (response.isSuccessful()) {
        return benefitsModelFromJson(response.body);
      } else {
        "${response.body.toJson()?.getValueOfKey("message") ?? Constants.somethingWrong.tr}".showSnackbar();
      }
      return null;
    } catch (e) {
      'msg_something_went_wrong'.tr.showSnackbar();
      return null;
    }
  }

  RxBool isLatestAchievementsLoading = false.obs;
  var model = Rxn<List<LatestAchievementModel>?>();
  Future<List<LatestAchievementModel>?> getLatestAchievements() async {
    isLatestAchievementsLoading.value = true;
    model.value = null;
    try {
      var response = await HttpServices.getJson(url: ApiConstants.latestAchievement,token: Singleton.token);
      if (response.isSuccessful()) {
        model.value =  latestAchievementModelFromJson(response.body);
      } else {
        "${response.body.toJson()?.getValueOfKey("message") ?? Constants.somethingWrong.tr}".showSnackbar();
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