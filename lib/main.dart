import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/auth_controller.dart';
import 'package:raudhatul_muhabbah/cotrollers/dashboard_controller.dart';
import 'package:raudhatul_muhabbah/cotrollers/login_controller.dart';
import 'package:raudhatul_muhabbah/cotrollers/singup_controller.dart';
import 'package:raudhatul_muhabbah/routes/rutes.dart';
import 'package:raudhatul_muhabbah/screens/splash_screen.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/notification_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationUtils.initFirebase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    Get.put(AuthController());
    Get.put(SignupController());
    Get.put(LoginController());
    return GetMaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: MyColors.colorPrimary, // Set your desired color
          ),
        ),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child ?? Container(),
        );
      },
      getPages: AppRoutes.rideRoutes(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.tag,
    );
  }
}