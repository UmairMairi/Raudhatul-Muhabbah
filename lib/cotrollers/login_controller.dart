import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/auth_controller.dart';
import 'package:raudhatul_muhabbah/extentions/map_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/response_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
import 'package:raudhatul_muhabbah/models/login_model.dart';
import 'package:raudhatul_muhabbah/network/api_constants.dart';
import 'package:raudhatul_muhabbah/network/http_services.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';

class LoginController extends AuthController {
  RxnString email = RxnString();
  RxnString password = RxnString();
  RxBool isLoginLoading = false.obs;

  Future<LoginModel?> login(
      {required String email, required String password}) async {
    try {
      isLoginLoading.value = true;
      var body = {
        "username": email,
        "password": password,
      };
      var response =
          await HttpServices.postJson(url: ApiConstants.login, body: body);
      if (response.isSuccessful()) {
        var model = loginModelFromJson(response.body);
        return model;
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ?? Constants.somethingWrong.tr}".showSnackbar();
      }
      isLoginLoading.value = false;
      return null;
    } catch (e) {
      isLoginLoading.value = false;
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }
}
