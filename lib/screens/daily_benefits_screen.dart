import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/dashboard_controller.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';
import 'package:raudhatul_muhabbah/utils/shimmer.dart';
import 'package:raudhatul_muhabbah/utils/widget_functions.dart';

class DailyBenefitsScreen extends StatefulWidget {
  const DailyBenefitsScreen({super.key});

  static const String tag = "/daily_benefits_screen";

  @override
  State<DailyBenefitsScreen> createState() => _DailyBenefitsScreenState();
}

class _DailyBenefitsScreenState extends State<DailyBenefitsScreen> {
  var controller = Get.find<DashboardController>();
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    controller.getBenefits();
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Constants.benefitsTitle, style: MyTextStyle.title),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: MyColors.greyBorderColor),
                ),
                child: Obx(() {
                  return (controller.isBenefitsLoading.value)
                      ? Shimmer.fromColors(
                          baseColor: MyColors.shimmerBaseColor,
                          highlightColor: MyColors.shimmerHighlightColor,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                    color: MyColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: MyColors.greyBorderColor),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "Sending salutations to our Prophet, peace be upon him, ",
                                          style: MyTextStyle.normal
                                              .copyWith(fontSize: 18),
                                        ),
                                        TextSpan(
                                          text:
                                              "(${Constants.readMore.toUpperCase()})",
                                          style: MyTextStyle.subTitle,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              WidgetFunction.showAlertDialog(
                                                  extraDetails: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          Constants
                                                              .benefitsDetails,
                                                          style: MyTextStyle
                                                              .title),
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          decoration: BoxDecoration(
                                                              color: MyColors
                                                                  .whiteColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  color: MyColors
                                                                      .blackColor)),
                                                          child: const Icon(
                                                            Icons.close,
                                                            color: MyColors
                                                                .blackColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  const Divider(),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 10.0),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                          color: MyColors
                                                              .greyBorderColor),
                                                    ),
                                                    child: Text(
                                                        "Sending salutations to our Prophet, peace be upon him, is not only a ritual performed on Friday night and Friday. It is a remembrance, a gratitude, and a life’s duty. Through it, Allah s.w.t will open your chest, forgive your sins, and suffice your worries. He, peace be upon him, said to the one who frequently sent salutations to him: “Then your worries will be satisfied, and your sins will be forgiven.",
                                                        style: MyTextStyle
                                                            .normal
                                                            .copyWith(
                                                                fontSize: 18)),
                                                  )
                                                ],
                                              ));
                                            },
                                        ),
                                      ],
                                    ),
                                  )),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    color: MyColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: MyColors.greyBorderColor),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Asalam Aleikum, Welcome !!!!",
                                          style: MyTextStyle.normal
                                              .copyWith(fontSize: 18),
                                        ),
                                        TextSpan(
                                          text:
                                              "  (${Constants.readMore.toUpperCase()})",
                                          style: MyTextStyle.subTitle,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              WidgetFunction.showAlertDialog(
                                                  extraDetails: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          Constants
                                                              .benefitsDetails,
                                                          style: MyTextStyle
                                                              .title),
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          decoration: BoxDecoration(
                                                              color: MyColors
                                                                  .whiteColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  color: MyColors
                                                                      .blackColor)),
                                                          child: const Icon(
                                                            Icons.close,
                                                            color: MyColors
                                                                .blackColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  const Divider(),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 10.0),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                          color: MyColors
                                                              .greyBorderColor),
                                                    ),
                                                    child: Text(
                                                        "Asalam Aleikum, Welcome !!!!",
                                                        style: MyTextStyle
                                                            .normal
                                                            .copyWith(
                                                                fontSize: 18)),
                                                  )
                                                ],
                                              ));
                                            },
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.benefitsModel.value?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: MyColors.greyBorderColor),
                                ),
                                child: Obx(() {
                                  return RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: controller.benefitsModel.value?[index].text.shortenText(),
                                          style: MyTextStyle.normal.copyWith(fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: "(${Constants.readMore.toUpperCase()})",
                                          style: MyTextStyle.subTitle,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              WidgetFunction.showAlertDialog(

                                                  extraDetails: Column(
                                                  children: [
                                                  Row(
                                                    children: [
                                                      Text(Constants.benefitsDetails, style: MyTextStyle.title),
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          padding: const EdgeInsets.all(5.0),
                                                          decoration: BoxDecoration(color: MyColors.whiteColor, shape: BoxShape.circle, border: Border.all(color: MyColors.blackColor)),
                                                          child: const Icon(Icons.close, color: MyColors.blackColor,),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10.0,),
                                                  const Divider(),
                                                  const SizedBox(height: 10.0,),
                                                  Container(
                                                    // height: MediaQuery.of(context).size.height*0.6,
                                                    constraints: BoxConstraints(maxHeight:  MediaQuery.of(context).size.height*0.6),
                                                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey.withOpacity(0.1),
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      border: Border.all(color: MyColors.greyBorderColor),
                                                    ),
                                                    child: SingleChildScrollView(
                                                      child: Text(controller.benefitsModel.value?[index].text ?? "",
                                                          style: MyTextStyle.normal.copyWith(fontSize: 18)),
                                                    ),
                                                  )
                                                ],
                                              ));
                                            },
                                        ),
                                      ],
                                    ),
                                  );
                                }));
                          },
                        );
                }),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
