import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/auth_controller.dart';
import 'package:raudhatul_muhabbah/extentions/map_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/response_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
import 'package:raudhatul_muhabbah/models/login_model.dart';
import 'package:raudhatul_muhabbah/network/api_constants.dart';
import 'package:raudhatul_muhabbah/network/http_services.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';

class SignupController extends AuthController {
  RxnString email = RxnString();
  RxnString password = RxnString();

  RxBool isRegisterLoading = false.obs;
  Future<dynamic> register({
    required String firstName,
    required String lastName,
    required String email,
    required String address,
    required String phone,
    required String password,
    required String gender
  }) async {
    try {
      isRegisterLoading.value = true;
      var body = {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "p_address": address,
        "phone_no": phone,
        "selectedGender": gender,
        "profile": {
          "phone_no": phone,
          "p_address": address,
          "gender": gender
        }
      };
      var response = await HttpServices.postJson(url: ApiConstants.register, body: body);
      if (response.isSuccessful()) {
        return true;
      } else {
        "${response.body.toJson()?.getValueOfKey("error") ?? Constants.somethingWrong.tr}".showSnackbar();
      }
      isRegisterLoading.value = false;
      return null;
    } catch (e) {
      isRegisterLoading.value = false;
      Constants.somethingWrong.tr.showSnackbar();
      return null;
    }
  }
}
