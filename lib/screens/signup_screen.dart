import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/dashboard_screen.dart';
import 'package:raudhatul_muhabbah/screens/login_screen.dart';
import 'package:raudhatul_muhabbah/screens/widgets/TextFieldPrimary.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/btn_primary.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String tag = "/signup_screen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              const SizedBox(height: 20.0,),
              Image.asset(Images.appLogo,height: 200,width: 200,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Text(Constants.signupInfo,
                  textAlign: TextAlign.center,
                  style: MyTextStyle.infoStyle),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                children: [
                  Expanded(
                    child: MyTextInputField(
                      title: Constants.titleFirstName,
                      isLabelRequired: true,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Expanded(
                    child: MyTextInputField(
                      title: Constants.titleLastName,
                      isLabelRequired: true,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                children: [
                  Expanded(
                    child: MyTextInputField(
                      title:  Constants.titleSignupEmail,
                      isLabelRequired: true,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Expanded(
                    child: MyTextInputField(
                      title:  Constants.titleAddress,
                      isLabelRequired: true,
                      keyboardType: TextInputType.streetAddress,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                children: [
                  Expanded(
                    child: MyTextInputField(
                      title:  Constants.titlePhone,
                      isLabelRequired: true,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Expanded(
                    child: MyTextInputField(
                      title:  Constants.titleSignupPassword,
                      isObscure: true,
                      isLabelRequired: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const MyTextInputField(
                title:  Constants.titleGender,
                isLabelRequired: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 40.0,
              ),
              PrimaryButton(
                title: Constants.btnSubmitTitle,
                backgroundColor: MyColors.colorBlue,
                borderColor: Colors.transparent,
                titleStyle:  MyTextStyle.buttonTitle.copyWith(color: MyColors.whiteColor),
                onPressed: (){
                  Get.offNamed(DashboardScreen.tag);
                },
              ),
              Row(
                children: [
                  const Spacer(),
                  PrimaryButton(
                    title: Constants.alreadyAccountInfo,
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    titleStyle: MyTextStyle.buttonTitle.copyWith(fontWeight: FontWeight.normal,color: MyColors.colorBlue),
                    onPressed: (){
                      Get.toNamed(LoginScreen.tag);
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
