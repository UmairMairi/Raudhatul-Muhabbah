import 'dart:math';

import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/auth_controller.dart';
import 'package:raudhatul_muhabbah/extentions/map_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/response_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
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
    String? address = "",
    String? phone = "",
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
      if(address == null || address.isEmpty){
        body['p_address'] = generateRandomKenyanAddress();
      }
      if(phone == null || phone.isEmpty){
        body['phone_no'] = generateKenyanPhoneNumber();
      }
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


  generateKenyanPhoneNumber() {
    final random = Random();
    String countryCode = '+254';
    String prefix = random.nextBool() ? '7' : '1';
    String number = List.generate(8, (_) => random.nextInt(10)).join();
    return '$countryCode$prefix$number';
  }

  generateRandomKenyanAddress() {
    final random = Random();

    List<String> cities = [
      'Nairobi',
      'Mombasa',
      'Kisumu',
      'Nakuru',
      'Eldoret',
      'Thika',
      'Nyeri',
      'Machakos',
      'Naivasha',
      'Kericho',
      'Malindi',
    ];

    List<String> streetNames = [
      'Kenyatta Avenue',
      'Moi Avenue',
      'Uhuru Highway',
      'Haile Selassie Avenue',
      'Kimathi Street',
      'Mama Ngina Street',
      'Ngong Road',
      'Mombasa Road',
      'Langata Road',
      'Tom Mboya Street',
    ];

    String street = streetNames[random.nextInt(streetNames.length)];
    String city = cities[random.nextInt(cities.length)];
    int buildingNumber = random.nextInt(500) + 1; // Random building number between 1 and 500
    int postalCode = 10000 + random.nextInt(80000); // Postal code range from 10000 to 89999

    return '$buildingNumber $street, $city, $postalCode, Kenya';
  }
}
