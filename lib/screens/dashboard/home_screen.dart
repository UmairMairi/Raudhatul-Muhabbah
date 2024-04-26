import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/screens/signup_screen.dart';
import 'package:raudhatul_muhabbah/screens/widgets/TextFieldPrimary.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/btn_primary.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';
import 'package:raudhatul_muhabbah/utils/widget_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String tag = "/home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;
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
              Text(Constants.highestAchiever, style: MyTextStyle.subTitle),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: MyColors.greyBorderColor),
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        children: [
                          Text(Constants.targets,
                              style: MyTextStyle.subTitle
                                  .copyWith(color: MyColors.colorBlue)),
                          const Spacer(),
                          const Column(
                            children: [
                              SizedBox(
                                height: 5.0,
                              ),
                              PrimaryButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 15.0),
                                title: "${Constants.achievement} : 1,000",
                                textColor: MyColors.colorPrimary,
                                backgroundColor: MyColors.colorPrimaryAccent,
                                borderColor: Colors.transparent,
                              ),
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
              Text(Constants.totalSalutations, style: MyTextStyle.subTitle),
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
                onChange: (val) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              PrimaryButton(
                title: Constants.submitTitle,
                backgroundColor: MyColors.colorPrimary,
                borderColor: Colors.transparent,
                textColor: MyColors.whiteColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                margin: const EdgeInsets.only(bottom: 50.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: MyColors.greyBorderColor),
                ),
                child: StatefulBuilder(
                  builder: (context,myState) {
                    return RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: isExpanded?
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                                  " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                                  " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi"
                                  " ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit"
                                  " in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur "
                                  "sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt"
                                  " mollit anim id est laborum."
                                  :"Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                                  " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: MyTextStyle.normal.copyWith(fontSize: 16.0,),
                          ),
                          TextSpan(
                            text: "  ${isExpanded ?Constants.showLess: Constants.readMore}",
                            style: MyTextStyle.subTitle.copyWith(color: MyColors.colorBlue),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              myState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
