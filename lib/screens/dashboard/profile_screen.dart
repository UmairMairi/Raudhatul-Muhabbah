import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/auth_controller.dart';
import 'package:raudhatul_muhabbah/cotrollers/dashboard_controller.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
import 'package:raudhatul_muhabbah/screens/signup_screen.dart';
import 'package:raudhatul_muhabbah/screens/widgets/TextFieldPrimary.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/btn_primary.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';
import 'package:raudhatul_muhabbah/utils/shimmer.dart';
import 'package:raudhatul_muhabbah/utils/widget_functions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String tag = "/profile_screen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.find<DashboardController>();
  var authController = Get.put(AuthController());
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.getProfileDetails();
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
      backgroundColor: MyColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(Constants.profileTitle, style: MyTextStyle.title),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColors.colorPrimary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Obx(() {
                          return Text(
                              "${controller.model.value?.first.achievementValue ?? ""} ${Constants.salutationsTitle}",
                              style: MyTextStyle.subTitle
                                  .copyWith(color: Colors.white));
                        }),
                        const Spacer(),
                        InkWell(
                          splashColor: Colors.grey,
                          onTap: () {},
                          child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: MyColors.whiteColor,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(Constants.historyTitle,
                                  style: MyTextStyle.subTitle
                                      .copyWith(color: Colors.white))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.blackColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Opacity(
                              opacity: 0,
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                    color: MyColors.colorPrimary,
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: MyColors.whiteColor)),
                                child: const Icon(
                                  Icons.edit,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: const FadeInImage(
                                height: 100,
                                placeholder: AssetImage(Images.placeholderMan),
                                image: AssetImage(Images.placeholderMan),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                WidgetFunction.showAlertDialog(
                                    extraDetails: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(Constants.editProfile,
                                            style: MyTextStyle.title),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                color: MyColors.whiteColor,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color:
                                                        MyColors.blackColor)),
                                            child: const Icon(
                                              Icons.close,
                                              color: MyColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
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
                                        SizedBox(
                                          width: 10.0,
                                        ),
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
                                      height: 10.0,
                                    ),
                                    const Row(
                                      children: [
                                        Expanded(
                                          child: MyTextInputField(
                                            title: Constants.titleSignupEmail,
                                            isLabelRequired: true,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: MyTextInputField(
                                            title: Constants.titlePhone,
                                            isLabelRequired: true,
                                            keyboardType: TextInputType.phone,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    const MyTextInputField(
                                      title: Constants.titleAddress,
                                      isLabelRequired: true,
                                      keyboardType: TextInputType.streetAddress,
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    PrimaryButton(
                                        title: Constants.submitTitle,
                                        backgroundColor: MyColors.colorPrimary,
                                        borderColor: Colors.transparent,
                                        titleStyle: MyTextStyle.buttonTitle
                                            .copyWith(
                                                color: MyColors.whiteColor),
                                        borderRadius:
                                            BorderRadius.circular(50.0))
                                  ],
                                ));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                    color: MyColors.colorPrimary,
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: MyColors.whiteColor)),
                                child: const Icon(
                                  Icons.edit,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Obx(() {
                          return (controller.isProfileLoading.value)
                              ? Shimmer.fromColors(
                                  baseColor: MyColors.shimmerBaseColor,
                                  highlightColor:
                                      MyColors.shimmerHighlightColor,
                                  child: Text("Test ABC",
                                      style: MyTextStyle.subTitle.copyWith(
                                          color: Colors.white,
                                          backgroundColor: Colors.black)),
                                )
                              : Text(controller.profileModel.value?.names ?? "",
                                  style: MyTextStyle.subTitle.copyWith(
                                      color: Colors.white,
                                      backgroundColor: Colors.black));
                        }),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Obx(() {
                          return (controller.isProfileLoading.value)
                              ? Shimmer.fromColors(
                                  baseColor: MyColors.shimmerBaseColor,
                                  highlightColor:
                                      MyColors.shimmerHighlightColor,
                                  child: Text("Test@mail.com",
                                      style: MyTextStyle.subTitle.copyWith(
                                          color: Colors.white,
                                          backgroundColor: Colors.black)))
                              : Text(controller.profileModel.value?.email ?? "",
                                  style: MyTextStyle.subTitle.copyWith(
                                      color: Colors.white,
                                      backgroundColor: Colors.black));
                        }),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Spacer(),
                PrimaryButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  title: Constants.resetPassword,
                  backgroundColor: MyColors.colorPrimary,
                  textColor: MyColors.whiteColor,
                  borderColor: Colors.transparent,
                  onPressed: () {
                    oldPasswordController.clear();
                    newPasswordController.clear();
                    WidgetFunction.showAlertDialog(
                        extraDetails: Column(
                      children: [
                        Row(
                          children: [
                            Text(Constants.changePassword,
                                style: MyTextStyle.title),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: MyColors.whiteColor,
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: MyColors.blackColor)),
                                child: const Icon(
                                  Icons.close,
                                  color: MyColors.blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        MyTextInputField(
                          title: Constants.oldPassword,
                          isLabelRequired: true,
                          controller: oldPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        MyTextInputField(
                          title: Constants.newPassword,
                          isLabelRequired: true,
                          keyboardType: TextInputType.visiblePassword,
                          controller: newPasswordController,
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
                          height: 20.0,
                        ),
                        PrimaryButton(
                          title: Constants.submitTitle,
                          backgroundColor: MyColors.colorPrimary,
                          borderColor: Colors.transparent,
                          titleStyle: MyTextStyle.buttonTitle
                              .copyWith(color: MyColors.whiteColor),
                          borderRadius: BorderRadius.circular(50.0),
                          onPressed: () {
                            authController.resetPassword(oldPassword: oldPasswordController.text, newPassword: newPasswordController.text).then((value){
                              if(value == true){
                                Constants.resetSuccess.tr.showSnackbar(isSuccess: true);
                              }
                            });
                          },
                        )
                      ],
                    ));
                  },
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
