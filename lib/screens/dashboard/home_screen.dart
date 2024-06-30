import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/dashboard_controller.dart';
import 'package:raudhatul_muhabbah/extentions/int_extentions.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/btn_primary.dart';
import 'package:raudhatul_muhabbah/screens/widgets/TextFieldPrimary.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';
import 'package:raudhatul_muhabbah/utils/shimmer.dart';
import 'package:raudhatul_muhabbah/utils/singlton.dart';
import 'package:raudhatul_muhabbah/utils/widget_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String tag = "/home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;
  var controller = Get.find<DashboardController>();
  var targetsController = TextEditingController();
  var achievementController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.getBenefits();
    controller.getHighestAchievement();
    controller.getTotalAchievements();
    controller.getLatestTargets();
    controller.getPrayerTimes();
    controller
        .getProfileDetails(id: "${Singleton.loginModel?.userId}")
        .then((value) {
      controller.updateProfile(
          id: "${Singleton.loginModel?.userId}",
          fName: value?.firstName ?? "",
          lastName: value?.lastName ?? "",
          email: value?.email ?? "",
          phone: value?.profile?.phoneNo ?? "",
          address: value?.profile?.pAddress ?? "");
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
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                if (controller.isTargetLoading.value) {
                  return Shimmer.fromColors(
                    highlightColor:
                    MyColors.shimmerHighlightColor,
                    baseColor: MyColors.shimmerBaseColor,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: MyColors.backgroundColor,
                        borderRadius:
                        BorderRadius.circular(10.0),
                        border: Border.all(
                            color:
                            MyColors.greyBorderColor),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 10.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                        Constants
                                            .yourTarget,
                                        style: MyTextStyle
                                            .medium
                                            .copyWith(
                                            fontSize:
                                            14,
                                            color: MyColors
                                                .greyAccent)),
                                    Row(
                                      children: [
                                        Text("${1234} ",
                                            style: MyTextStyle
                                                .subTitle
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.bold)),
                                        Text(
                                            Constants
                                                .motivation,
                                            style: MyTextStyle
                                                .medium
                                                .copyWith(
                                                fontSize:
                                                14,
                                                color:
                                                MyColors.greyAccent)),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                      horizontal: 8.0,
                                      vertical: 12.0),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          30.0),
                                      border: Border.all(
                                          width: 2,
                                          color: MyColors
                                              .colorPrimary)),
                                  child: SvgPicture.asset(
                                    Images
                                        .iconAchievement,
                                    color: MyColors
                                        .colorPrimary,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 5.0,
                            decoration:
                            const BoxDecoration(
                              color:
                              MyColors.colorPrimary,
                              borderRadius:
                              BorderRadius.only(
                                  topLeft: Radius
                                      .circular(10),
                                  topRight:
                                  Radius.circular(
                                      10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Obx(() {
                  return (controller.prayerTimeLoading.value)
                      ? Shimmer.fromColors(
                    highlightColor:
                    MyColors.shimmerHighlightColor,
                    baseColor: MyColors.shimmerBaseColor,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: MyColors.backgroundColor,
                        borderRadius:
                        BorderRadius.circular(10.0),
                        border: Border.all(
                            color:
                            MyColors.greyBorderColor),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 10.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                        Constants
                                            .yourTarget,
                                        style: MyTextStyle
                                            .medium
                                            .copyWith(
                                            fontSize:
                                            14,
                                            color: MyColors
                                                .greyAccent)),
                                    Row(
                                      children: [
                                        Text("${1234} ",
                                            style: MyTextStyle
                                                .subTitle
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.bold)),
                                        Text(
                                            Constants
                                                .motivation,
                                            style: MyTextStyle
                                                .medium
                                                .copyWith(
                                                fontSize:
                                                14,
                                                color:
                                                MyColors.greyAccent)),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                      horizontal: 8.0,
                                      vertical: 12.0),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          30.0),
                                      border: Border.all(
                                          width: 2,
                                          color: MyColors
                                              .colorPrimary)),
                                  child: SvgPicture.asset(
                                    Images
                                        .iconAchievement,
                                    color: MyColors
                                        .colorPrimary,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 5.0,
                            decoration:
                            const BoxDecoration(
                              color:
                              MyColors.colorPrimary,
                              borderRadius:
                              BorderRadius.only(
                                  topLeft: Radius
                                      .circular(10),
                                  topRight:
                                  Radius.circular(
                                      10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                      : (controller.activateAchievementForm(
                              fajar: controller.prayerTimeModel.value?.data?.first.timings?.fajr,
                              maghrib: controller.prayerTimeModel.value?.data?.first.timings?.maghrib))
                          ? Column(
                              children: [
                                Text(Constants.highestAchiever,
                                    style: MyTextStyle.subTitle),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: MyColors.greyBorderColor),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: [
                                            Expanded(child: Obx(() {
                                              return Text(
                                                  "${Constants.targets} : ${controller.highestAchieverModel.value?.targetValue.format() ?? 0}",
                                                  style: MyTextStyle.subTitle
                                                      .copyWith(
                                                          color: MyColors
                                                              .colorBlue));
                                            })),
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                Obx(() {
                                                  return PrimaryButton(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 15.0),
                                                    title:
                                                        "${Constants.achievement} : ${controller.highestAchieverModel.value?.achievementValue.format() ?? 0}",
                                                    textColor:
                                                        MyColors.colorPrimary,
                                                    backgroundColor: MyColors
                                                        .colorPrimaryAccent,
                                                    borderColor:
                                                        Colors.transparent,
                                                  );
                                                }),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 5.0,
                                        decoration: const BoxDecoration(
                                          color: MyColors.colorBlue,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Obx(() {
                                  return (controller
                                          .isLatestTargetLoading.value)
                                      ? Shimmer.fromColors(
                                          highlightColor:
                                              MyColors.shimmerHighlightColor,
                                          baseColor: MyColors.shimmerBaseColor,
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: MyColors.backgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color:
                                                      MyColors.greyBorderColor),
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 10.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              Constants
                                                                  .yourTarget,
                                                              style: MyTextStyle
                                                                  .medium
                                                                  .copyWith(
                                                                      fontSize:
                                                                          14,
                                                                      color: MyColors
                                                                          .greyAccent)),
                                                          Row(
                                                            children: [
                                                              Text("${1234} ",
                                                                  style: MyTextStyle
                                                                      .subTitle
                                                                      .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                              Text(
                                                                  Constants
                                                                      .motivation,
                                                                  style: MyTextStyle
                                                                      .medium
                                                                      .copyWith(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              MyColors.greyAccent)),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8.0,
                                                                vertical: 12.0),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                            border: Border.all(
                                                                width: 2,
                                                                color: MyColors
                                                                    .colorPrimary)),
                                                        child: SvgPicture.asset(
                                                          Images
                                                              .iconAchievement,
                                                          color: MyColors
                                                              .colorPrimary,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 5.0,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color:
                                                        MyColors.colorPrimary,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : (controller.latestTargetModel.value !=
                                                  null &&
                                              controller.latestTargetModel.value!.isNotEmpty)
                                          ? Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                    color: MyColors
                                                        .greyBorderColor),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 10.0),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                Constants
                                                                    .yourTarget,
                                                                style: MyTextStyle
                                                                    .medium
                                                                    .copyWith(
                                                                        fontSize:
                                                                            14,
                                                                        color: MyColors
                                                                            .greyAccent)),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "${controller.latestTargetModel.value!.first.targetValue} ",
                                                                    style: MyTextStyle
                                                                        .subTitle
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                if (controller
                                                                        .latestTargetModel
                                                                        .value!
                                                                        .first
                                                                        .targetValue! <
                                                                    1000)
                                                                  Text(
                                                                      Constants
                                                                          .motivation,
                                                                      style: MyTextStyle.medium.copyWith(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              MyColors.greyAccent)),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        GestureDetector(
                                                          onTap: () {
                                                            WidgetFunction
                                                                .showAlertDialog(
                                                              extraDetails:
                                                                  Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                          Constants
                                                                              .setCount,
                                                                          style:
                                                                              MyTextStyle.title),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              5.0),
                                                                          decoration: BoxDecoration(
                                                                              color: MyColors.whiteColor,
                                                                              shape: BoxShape.circle,
                                                                              border: Border.all(color: MyColors.blackColor)),
                                                                          child:
                                                                              const Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                MyColors.blackColor,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height:
                                                                        10.0,
                                                                  ),
                                                                  MyTextInputField(
                                                                    title: Constants
                                                                        .achievement,
                                                                    isLabelRequired:
                                                                        true,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .streetAddress,
                                                                    controller:
                                                                        achievementController,
                                                                  ),
                                                                  const SizedBox(
                                                                    height:
                                                                        20.0,
                                                                  ),
                                                                  Obx(() {
                                                                    return (controller
                                                                            .isSubmitAchievementLoading
                                                                            .value)
                                                                        ? PrimaryButton(
                                                                            title:
                                                                                Constants.addingAchievement,
                                                                            backgroundColor:
                                                                                MyColors.colorPrimary.withOpacity(0.8),
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            titleStyle:
                                                                                MyTextStyle.buttonTitle.copyWith(color: MyColors.whiteColor),
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                            leadingChild:
                                                                                Container(
                                                                              height: 20.0,
                                                                              width: 20.0,
                                                                              margin: const EdgeInsets.only(right: 10.0),
                                                                              child: const CircularProgressIndicator(
                                                                                strokeWidth: 2,
                                                                                color: MyColors.whiteColor,
                                                                              ),
                                                                            ),
                                                                          )
                                                                        : PrimaryButton(
                                                                            title:
                                                                                Constants.submitTitle,
                                                                            backgroundColor:
                                                                                MyColors.colorPrimary,
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            titleStyle:
                                                                                MyTextStyle.buttonTitle.copyWith(color: MyColors.whiteColor),
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                            onPressed:
                                                                                () {
                                                                              controller.submitAchievement(achievementValue: achievementController.text, targetId: controller.latestTargetModel.value!.first.id!).then((value) {
                                                                                Get.back();
                                                                                controller.getLatestTargets();
                                                                                controller.getTotalAchievements();
                                                                              });
                                                                            },
                                                                          );
                                                                  })
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        8.0,
                                                                    vertical:
                                                                        12.0),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                                border: Border.all(
                                                                    width: 2,
                                                                    color: MyColors
                                                                        .colorPrimary)),
                                                            child: SvgPicture
                                                                .asset(
                                                              Images
                                                                  .iconAchievement,
                                                              color: MyColors
                                                                  .colorPrimary,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 5.0,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color:
                                                          MyColors.colorPrimary,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container();
                                }),
                              ],
                            )
                          : Text(Constants.achievementsAvailability,
                              textAlign: TextAlign.center,
                              style: MyTextStyle.normal.copyWith(
                                  fontSize: 16.0, color: MyColors.redColor));
                });
              }),
              const SizedBox(
                height: 10.0,
              ),
              Obx(() {
                return Text(
                    "${Constants.totalSalutations} ${(controller.totalAchievements.value ?? 0).format()}",
                    style: MyTextStyle.subTitle);
              }),
              const SizedBox(
                height: 10.0,
              ),
              Text(Constants.setTarget,
                  style: MyTextStyle.medium.copyWith(fontSize: 25)),
              const SizedBox(
                height: 10.0,
              ),
              Text(Constants.targetInfo,
                  textAlign: TextAlign.center,
                  style: MyTextStyle.normal.copyWith(fontSize: 16.0)),
              const SizedBox(
                height: 20.0,
              ),
              MyTextInputField(
                keyboardType: TextInputType.number,
                lines: 1,
                controller: targetsController,
                onChange: (val) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              Obx(() {
                if (controller.isTargetLoading.value) {
                  return PrimaryButton(
                    title: Constants.addingTarget,
                    backgroundColor: MyColors.colorPrimary.withOpacity(0.8),
                    borderColor: Colors.transparent,
                    textColor: MyColors.whiteColor,
                    borderRadius: BorderRadius.circular(50.0),
                    leadingChild: Container(
                        height: 20.0,
                        width: 20.0,
                        margin: const EdgeInsets.only(right: 10.0),
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: MyColors.whiteColor,
                        )),
                  );
                }
                return Obx(() {
                  return (controller.prayerTimeLoading.value)
                      ? Shimmer.fromColors(
                          baseColor: MyColors.shimmerBaseColor,
                          highlightColor: MyColors.shimmerHighlightColor,
                          child: PrimaryButton(
                            title: Constants.addingAchievement,
                            backgroundColor:
                                MyColors.colorPrimary.withOpacity(0.8),
                            borderColor: Colors.transparent,
                            titleStyle: MyTextStyle.buttonTitle
                                .copyWith(color: MyColors.whiteColor),
                            borderRadius: BorderRadius.circular(50.0),
                            leadingChild: Container(
                              height: 20.0,
                              width: 20.0,
                              margin: const EdgeInsets.only(right: 10.0),
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: MyColors.whiteColor,
                              ),
                            ),
                          ),
                        )
                      : (controller.activateTargetForm(
                              fajar: controller.prayerTimeModel.value?.data
                                  ?.first.timings?.fajr,
                              dhuhur: controller.prayerTimeModel.value?.data
                                  ?.first.timings?.dhuhr))
                          ? PrimaryButton(
                              title: Constants.submitTitle,
                              backgroundColor: MyColors.colorPrimary,
                              borderColor: Colors.transparent,
                              textColor: MyColors.whiteColor,
                              borderRadius: BorderRadius.circular(50.0),
                              onPressed: () {
                                controller
                                    .submitTarget(
                                        targets: targetsController.text)
                                    .then((value) {
                                  if (value?.id != null) {
                                    targetsController.clear();
                                    controller.getLatestTargets();
                                  }
                                });
                              },
                            )
                          : Text(Constants.targetAvailability,
                              textAlign: TextAlign.center,
                              style: MyTextStyle.normal.copyWith(
                                  fontSize: 16.0, color: MyColors.redColor));
                });
              }),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Constants.benefits,
                      style: MyTextStyle.subTitle.copyWith(
                        color: MyColors.colorBlue,
                      )),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: MyColors.colorBlue,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Obx(() {
                return (controller.isBenefitsLoading.value)
                    ? Shimmer.fromColors(
                        baseColor: MyColors.shimmerBaseColor,
                        highlightColor: MyColors.shimmerHighlightColor,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          margin: const EdgeInsets.only(bottom: 50.0),
                          decoration: BoxDecoration(
                            color: MyColors.backgroundColor,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: MyColors.greyBorderColor),
                          ),
                          child: StatefulBuilder(builder: (context, myState) {
                            return RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                                        " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                                        " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi"
                                        " ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit"
                                        " in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur "
                                        "sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt"
                                        " mollit anim id est laborum.",
                                    style: MyTextStyle.normal.copyWith(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "  ${isExpanded ? Constants.showLess : Constants.readMore}",
                                    style: MyTextStyle.subTitle
                                        .copyWith(color: MyColors.colorBlue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        myState(() {
                                          isExpanded = !isExpanded;
                                        });
                                      },
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        margin: const EdgeInsets.only(bottom: 50.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: MyColors.greyBorderColor),
                        ),
                        child: (controller.benefitsModel.value != null &&
                                controller.benefitsModel.value!.isNotEmpty)
                            ? StatefulBuilder(builder: (context, myState) {
                                return RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: isExpanded
                                            ? controller
                                                .benefitsModel.value!.first.text
                                            : controller
                                                .benefitsModel.value!.first.text
                                                .shortenText(maxLength: 150),
                                        style: MyTextStyle.normal.copyWith(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "  ${isExpanded ? Constants.showLess : Constants.readMore}",
                                        style: MyTextStyle.subTitle.copyWith(
                                            color: MyColors.colorBlue),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            myState(() {
                                              isExpanded = !isExpanded;
                                            });
                                          },
                                      ),
                                    ],
                                  ),
                                );
                              })
                            : Center(
                                child: Text(Constants.noBenefits,
                                    style: MyTextStyle.normal.copyWith(
                                      fontSize: 16.0,
                                    ))));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
