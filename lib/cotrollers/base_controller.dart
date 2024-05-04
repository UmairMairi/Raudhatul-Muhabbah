import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(isLoading, (value) {
      if (kDebugMode) {
        print("Loading-------------->$value");
      }
    });
  }
}