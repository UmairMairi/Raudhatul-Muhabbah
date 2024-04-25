import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/screens/signup_screen.dart';
import 'package:raudhatul_muhabbah/screens/widgets/TextFieldPrimary.dart';
import 'package:raudhatul_muhabbah/screens/widgets/btn_primary.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String tag = "/login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0,),
              Image.asset(Images.appLogo,height: 200,width: 200,),
              Text(Constants.info,style: MyTextStyle.infoStyle),
              const SizedBox(
                height: 20.0,
              ),
              const MyTextInputField(
                title: Constants.titleEmail,
                isLabelRequired: true,
                hintText: Constants.emailPlaceholder,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const MyTextInputField(
                title:  Constants.titlePassword,
                isLabelRequired: true,
                hintText: Constants.passwordPlaceholder,
              ),
              const SizedBox(
                height: 40.0,
              ),
              PrimaryButton(
                title: Constants.buttonTitle,
                backgroundColor: MyColors.colorBlue,
                borderColor: Colors.transparent,
                titleStyle:  MyTextStyle.buttonTitle.copyWith(color: MyColors.whiteColor),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Spacer(),
                  PrimaryButton(
                    title: Constants.notAccountInfo,
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    titleStyle: MyTextStyle.buttonTitle.copyWith(fontWeight: FontWeight.normal,color: MyColors.colorBlue),
                    onPressed: (){
                      Get.toNamed(SignupScreen.tag);
                    },
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
