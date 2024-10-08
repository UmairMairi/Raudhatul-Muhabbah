
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/screens/about_screen.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/dashboard_screen.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/tasbih_screen.dart';
import 'package:raudhatul_muhabbah/screens/login_screen.dart';
import 'package:raudhatul_muhabbah/screens/signup_screen.dart';
import 'package:raudhatul_muhabbah/screens/splash_screen.dart';

class AppRoutes {
  static rideRoutes() => [
        Generalized.generalized(SplashScreen.tag, () => const SplashScreen()),
        Generalized.generalized(LoginScreen.tag, () => const LoginScreen()),
        Generalized.generalized(SignupScreen.tag, () => const SignupScreen()),
        Generalized.generalized(DashboardScreen.tag, () => const DashboardScreen()),
        Generalized.generalized(AboutScreen.tag, () => const AboutScreen()),
        Generalized.generalized(TasbihScreen.tag, () => const TasbihScreen()),
      ];

//  extra  screen
}

class Generalized {
  static GetPage generalized(
    String name,
    dynamic page, {
    dynamic arguments,
    Transition? transition,
    bool? opaque,
    Bindings? binding,
    List<Bindings>? bindings,
    /*CustomTransition? customTransition*/
  }) {
    return GetPage(
      name: name,
      page: page,
      curve: Curves.easeInOutQuad,
      arguments: arguments,
      binding: binding,
      transition: transition ?? Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
      bindings: bindings ?? [],
    );
  }
}
