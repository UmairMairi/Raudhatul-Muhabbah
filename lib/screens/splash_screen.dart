
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/dashboard_screen.dart';
import 'package:raudhatul_muhabbah/screens/login_screen.dart';
import 'package:raudhatul_muhabbah/utils/PrefUtils.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/singlton.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String tag = "/splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,()async{
      var token = await MyPrefUtils.getString(MyPrefUtils.tokenKey);
      if(token.isNotEmpty){
        Singleton.token = token;
        Get.offNamed(DashboardScreen.tag);
      }else{
        Get.offNamed(LoginScreen.tag);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    if (height < width) {
      width = height;
      height = width;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: MyColors.backgroundColor,
      body: Center(
        child: Image.asset(Images.appLogo,height: 200,width: 200,),
      ),
    );
  }
}
