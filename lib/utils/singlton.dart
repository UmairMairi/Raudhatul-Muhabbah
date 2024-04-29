

import 'package:raudhatul_muhabbah/models/login_model.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();
  static String? token;
  static LoginModel? loginModel;

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}
