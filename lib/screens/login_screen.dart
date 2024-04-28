import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/auth_controller.dart';
import 'package:raudhatul_muhabbah/cotrollers/login_controller.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/dashboard_screen.dart';
import 'package:raudhatul_muhabbah/screens/signup_screen.dart';
import 'package:raudhatul_muhabbah/screens/widgets/TextFieldPrimary.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/btn_primary.dart';
import 'package:raudhatul_muhabbah/utils/PrefUtils.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';
import 'package:raudhatul_muhabbah/utils/singlton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String tag = "/login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller = Get.put(LoginController());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
              const SizedBox(
                height: 50.0,
              ),
              Image.asset(
                Images.appLogo,
                height: 200,
                width: 200,
              ),
              Text(Constants.info, style: MyTextStyle.infoStyle),
              const SizedBox(
                height: 20.0,
              ),
              MyTextInputField(
                title: Constants.titleEmail,
                isLabelRequired: true,
                hintText: Constants.emailPlaceholder,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                onChange: (val) {
                  controller.email.value = val;
                },
                validator: (value) {
                  switch (value) {
                    case null:
                      {
                        return Constants.validEmail;
                      }
                    default:
                      if (value.isValidEmail()) {
                        return Constants.validEmail;
                      } else {
                        return null;
                      }
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              MyTextInputField(
                title: Constants.titlePassword,
                keyboardType: TextInputType.visiblePassword,
                isLabelRequired: true,
                hintText: Constants.passwordPlaceholder,
                isObscure: true,
                controller: passwordController,
                onChange: (val) {
                  controller.password.value = val;
                },
                validator: (value) {
                  switch (value) {
                    case null:
                      {
                        return Constants.validPassword;
                      }
                    default:
                      if (value.length < 6) {
                        return Constants.passwordRange;
                      } else {
                        return null;
                      }
                  }
                },
              ),
              const SizedBox(
                height: 40.0,
              ),
              Obx(() {
                var enabled = (controller.email.value != null &&
                    controller.email.value!.isNotEmpty &&
                    controller.password.value != null &&
                    controller.password.value!.isNotEmpty);
                return PrimaryButton(
                  enabled: enabled,
                  title: controller.isLoginLoading.value
                      ? Constants.buttonTitle2
                      : Constants.buttonTitle,
                  backgroundColor: MyColors.colorBlue,
                  borderColor: Colors.transparent,
                  titleStyle: MyTextStyle.buttonTitle
                      .copyWith(color: MyColors.whiteColor),
                  leadingChild: controller.isLoginLoading.value
                      ? Container(
                          height: 20.0,
                          width: 20.0,
                          margin: const EdgeInsets.only(right: 10.0),
                          child: const CircularProgressIndicator(
                            color: MyColors.whiteColor,
                            strokeWidth: 2,
                          ))
                      : null,
                  onPressed: () {
                    controller.login(
                      email: emailController.text,
                      password: passwordController.text,
                    ).then((value) {
                      if (value?.key != null) {
                        MyPrefUtils.putString(MyPrefUtils.tokenKey, value!.key!);
                        Singleton.token = value.key;
                        Get.toNamed(DashboardScreen.tag);
                      }
                    });
                  },
                );
              }),
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
                    titleStyle: MyTextStyle.buttonTitle.copyWith(
                        fontWeight: FontWeight.normal,
                        color: MyColors.colorBlue),
                    onPressed: () {
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
