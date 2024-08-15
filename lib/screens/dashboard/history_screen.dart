import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/dashboard_controller.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/date_utils.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';
import 'package:raudhatul_muhabbah/utils/shimmer.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  static const String tag = "/history_screen";

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var selectedIndex = 0;
  var controller = Get.find<DashboardController>();

  @override
  void initState() {
    super.initState();
    controller.getLatestAchievements();
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Constants.historyTitle, style: MyTextStyle.title),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: MyColors.colorPrimary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text(Constants.salutationsTitle,
                      style:
                          MyTextStyle.subTitle.copyWith(color: Colors.white)),
                  Obx(() {
                    var total = controller.model.value?.fold(0, (acc, element) => acc + (element.achievementValue ?? 0) );
                      return Text("${Constants.total} $total",
                          style: MyTextStyle.bold
                              .copyWith(fontSize: 25, color: Colors.white));
                    }
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Obx(() {
                    var text = Constants.lastEntries.replaceFirst("___", "${controller.model.value?.length ?? 0}");
                    return Text("($text)",
                        style:
                            MyTextStyle.subTitle.copyWith(color: Colors.white));
                  }),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: const BoxDecoration(
                        color: MyColors.blackColor,
                      ),
                      child: Obx(() {
                          return Text(
                              "${Constants.lastUpdate} : ${DateTimeUtils.parseDate(date: "${controller.model.value?.first.createdOn}")}",
                              style: MyTextStyle.text.copyWith(color: Colors.white));
                        }
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Constants.salutationHistory, style: MyTextStyle.subTitle),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(2.5)),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(Constants.targets, style: MyTextStyle.text),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                              color: MyColors.colorPrimary.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(2.5)),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(Constants.achievement, style: MyTextStyle.text),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Obx(() {
                return (controller.isLatestAchievementsLoading.value)
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: MyColors.shimmerBaseColor,
                            highlightColor: MyColors.shimmerHighlightColor,
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                color: MyColors.salutationHistoryBackground,
                                borderRadius: BorderRadius.circular(5.0),
                                border: selectedIndex == index
                                    ? Border.all(
                                        color: MyColors.colorPrimary,
                                        width: 1.0)
                                    : null,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Images.appLogo,
                                    height: 100,
                                    width: 100,
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          decoration: BoxDecoration(
                                            color: MyColors.colorPrimaryAccent,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Text("2,000",
                                              style: MyTextStyle.subTitle
                                                  .copyWith(
                                                      color: MyColors
                                                          .colorPrimary)),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          decoration: BoxDecoration(
                                            color: MyColors.colorBlueAccent,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Text("2,000",
                                              style: MyTextStyle.subTitle
                                                  .copyWith(
                                                      color:
                                                          MyColors.colorBlue)),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text("10.81 %",
                                            style: MyTextStyle.subTitle),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Text("2024-04-12 11:49PM",
                                            style: MyTextStyle.text)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.model.value?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                color: (controller.model.value![index].achievementValue ?? 0) <
                                        (controller.model.value![index].targetValue ?? 0)
                                    ? Colors.red.withOpacity(0.2)
                                    : MyColors.salutationHistoryBackground,
                                borderRadius: BorderRadius.circular(5.0),
                                border: selectedIndex == index
                                    ? Border.all(
                                        color: (controller.model.value![index].achievementValue ?? 0) <
                                            (controller.model.value![index].targetValue ?? 0)
                                            ? Colors.red
                                            : MyColors.colorPrimary,
                                        width: 1.0)
                                    : null,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Images.appLogo,
                                    height: 100,
                                    width: 100,
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          decoration: BoxDecoration(
                                            color: MyColors.colorPrimaryAccent,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Obx(() {
                                              return Text("${controller.model.value![index].achievementValue  ?? 0}",
                                                  style: MyTextStyle.subTitle
                                                      .copyWith(
                                                          color: MyColors
                                                              .colorPrimary));
                                            }
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          decoration: BoxDecoration(
                                            color: MyColors.colorBlueAccent,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Obx(() {
                                              return Text("${controller.model.value![index].targetValue  ?? 0}",
                                                  style: MyTextStyle.subTitle
                                                      .copyWith(
                                                          color:
                                                              MyColors.colorBlue));
                                            }
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Obx(() {
                                          return Text(
                                              "${controller.model.value![index].percentage ?? 0.0} %",
                                              style: MyTextStyle.subTitle);
                                          }
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Obx(() {
                                            return Text(DateTimeUtils.parseDate(date: "${controller.model.value![index].createdOn}"),
                                                style: MyTextStyle.text);
                                          }
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
