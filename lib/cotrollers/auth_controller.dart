import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/base_controller.dart';
import 'package:raudhatul_muhabbah/extentions/map_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/response_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
import 'package:raudhatul_muhabbah/network/api_constants.dart';
import 'package:raudhatul_muhabbah/network/http_services.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/singlton.dart';

class AuthController extends BaseController {
  Future resetPassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      isLoading.value = true;
      var body = {"oldPass": oldPassword, "newPass": newPassword};
      var response = await HttpServices.postJson(
          url: ApiConstants.resetPassword, body: body,token: Singleton.token);
      if (response.isSuccessful()) {
        isLoading.value = false;
        Get.back();
        return true;
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ?? Constants.somethingWrong.tr}".showSnackbar();
      }
      isLoading.value = false;
      return null;
    } catch (e) {
      isLoading.value = false;
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }
}
