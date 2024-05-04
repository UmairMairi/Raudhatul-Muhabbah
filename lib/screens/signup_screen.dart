import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/singup_controller.dart';
import 'package:raudhatul_muhabbah/extentions/context_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/btn_primary.dart';
import 'package:raudhatul_muhabbah/screens/login_screen.dart';
import 'package:raudhatul_muhabbah/screens/widgets/TextFieldPrimary.dart';
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
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var genderController = TextEditingController(text: "Male");
  var controller = Get.find<SignupController>();
  final _formKey = GlobalKey<FormState>();
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  Images.appLogo,
                  height: 200,
                  width: 200,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(Constants.signupInfo,
                      textAlign: TextAlign.center, style: MyTextStyle.infoStyle),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextInputField(
                        title: Constants.titleFirstName,
                        isLabelRequired: true,
                        keyboardType: TextInputType.text,
                        controller: firstNameController,
                        validator: (val){
                          if(val!= null && val.isEmpty){
                            return Constants.enterValidName;
                          }
                          return null;

                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: MyTextInputField(
                        title: Constants.titleLastName,
                        isLabelRequired: true,
                        keyboardType: TextInputType.text,
                        controller: lastNameController,
                        validator: (val){
                          if(val!= null && val.isEmpty){
                            return Constants.enterValidName;
                          }
                          return null;
                        },

                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextInputField(
                        title: Constants.titleSignupEmail,
                        isLabelRequired: true,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          switch (value) {
                            case null:
                              {
                                return Constants.validEmail;
                              }
                            default:
                              if (!value.isValidEmail()) {
                                return Constants.validEmail;
                              } else {
                                return null;
                              }
                          }
                        },

                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: MyTextInputField(
                        title: Constants.titleAddress,
                        isLabelRequired: true,
                        keyboardType: TextInputType.streetAddress,
                        controller: addressController,
                        validator: (val){
                          if(val!= null && val.isEmpty){
                            return Constants.enterValidAddress;
                          }
                          return null;

                        },

                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextInputField(
                        title: Constants.titlePhone,
                        isLabelRequired: true,
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        validator: (val){
                          if(val!= null && val.isEmpty){
                            return Constants.enterValidPhone;
                          }
                          return null;

                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: MyTextInputField(
                        title: Constants.titleSignupPassword,
                        isObscure: true,
                        isLabelRequired: true,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        validator: (value) {
                          switch (value) {
                            case null:
                              {
                                return Constants.validPassword;
                              }
                            default:
                              if (value.length < 8) {
                                return Constants.passwordRange;
                              } else {
                                return null;
                              }
                          }
                        },

                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MyTextInputField(
                  title: Constants.titleGender,
                  controller: genderController,
                  isLabelRequired: true,
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  suffix: InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      context
                          .showBottomSheet(
                              child: Container(
                        color: MyColors.backgroundColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  "Select Gender",
                                  style: MyTextStyle.title,
                                )),
                            const Divider(),
                            ListTile(
                              title: Text(
                                "Male",
                                style: MyTextStyle.textFieldTextStyle,
                              ),
                              onTap: () {
                                Get.back(result: "Male");
                              },
                            ),
                            const Divider(),
                            ListTile(
                              title: Text(
                                "Female",
                                style: MyTextStyle.textFieldTextStyle,
                              ),
                              onTap: () {
                                Get.back(result: "Female");
                              },
                            ),
                            const Divider(),
                          ],
                        ),
                      ))
                          .then((value) {
                        if (value != null) {
                          genderController.text = value;
                        }
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.zero,
                        child: const Icon(Icons.keyboard_arrow_down_outlined)),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Obx(() {
                  return (controller.isRegisterLoading.value)
                      ? PrimaryButton(
                          title: Constants.sendingRequest,
                          backgroundColor: MyColors.colorBlue.withOpacity(0.8),
                          borderColor: Colors.transparent,
                          titleStyle: MyTextStyle.buttonTitle.copyWith(
                              fontWeight: FontWeight.normal,
                              color: MyColors.whiteColor),
                          leadingChild: Container(
                            height: 20.0,
                            width: 20.0,
                            margin: const EdgeInsets.only(right: 10.0),
                            child: const CircularProgressIndicator(
                              color: MyColors.whiteColor,
                              strokeWidth: 2,
                            ),
                          ),
                        )
                      : PrimaryButton(
                          title: Constants.btnSubmitTitle,
                          backgroundColor: MyColors.colorBlue,
                          borderColor: Colors.transparent,
                          titleStyle: MyTextStyle.buttonTitle.copyWith(color: MyColors.whiteColor),
                          onPressed: () {
                            if(_formKey.currentState?.validate() == true){
                              controller.register(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  address: addressController.text,
                                  phone: phoneController.text,
                                  password: phoneController.text,
                                  gender: genderController.text.toLowerCase()).then((value) {
                                    if(value == true){
                                      Constants.registerSuccess.showSnackbar(isSuccess: true);
                                      Get.offAndToNamed(LoginScreen.tag);
                                    }
                              });
                            }
                          },
                        );
                }),
                Row(
                  children: [
                    const Spacer(),
                    PrimaryButton(
                      title: Constants.alreadyAccountInfo,
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      titleStyle: MyTextStyle.buttonTitle.copyWith(fontWeight: FontWeight.normal, color: MyColors.colorBlue),
                      onPressed: () {
                        Get.toNamed(LoginScreen.tag);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
