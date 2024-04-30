import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/screens/signup_screen.dart';
import 'package:raudhatul_muhabbah/screens/widgets/TextFieldPrimary.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/btn_primary.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';
import 'package:raudhatul_muhabbah/utils/widget_functions.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  static const String tag = "/tasbih_screen";

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  var list = ["اللهـــــــــــــــم صلِّ وسلِّم عليه وعلى آله "];
  final _controller = TextEditingController();
  var count = 0;

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
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: MyColors.greyBorderColor),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                          offset: const Offset(0, 0.5),
                          color: MyColors.blackColor.withOpacity(0.2))
                    ]),
                child: Text(Constants.tasbihTitle, style: MyTextStyle.title),
              ),
              const SizedBox(
                height: 20.0,
              ),
              MyTextInputField(
                controller: _controller,
                borderRadius: BorderRadius.circular(10.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Spacer(),
                  PrimaryButton(
                    title: Constants.addDhikr,
                    backgroundColor: MyColors.colorBlue,
                    borderColor: Colors.transparent,
                    textColor: MyColors.whiteColor,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        list.add(_controller.text);
                        _controller.clear();
                      });
                    },
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              (list.isEmpty)
                  ? Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: MyColors.backgroundColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: MyColors.greyBorderColor),
                      ),
                      child: Text(Constants.noDhkirAvailbale,
                          style: MyTextStyle.subTitle),
                    )
                  : Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      decoration: BoxDecoration(
                        color: MyColors.backgroundColor,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: MyColors.greyBorderColor),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: list.map<Widget>((e) {
                          return Container(
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            margin: const EdgeInsets.only(bottom: 5.0),
                            decoration: BoxDecoration(
                              color: MyColors.backgroundColor,
                              borderRadius: BorderRadius.circular(5.0),
                              border:
                                  Border.all(color: MyColors.greyBorderColor),
                            ),
                            child: Row(
                              children: [
                                RichText(
                                  maxLines: 1,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${(list.indexOf(e) + 1)}) ",
                                        style: MyTextStyle.normal.copyWith(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: "${e.capitalizeFirst}",
                                        style: MyTextStyle.normal.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      list.remove(e);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        color: MyColors.whiteColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: MyColors.blackColor)),
                                    child: const Icon(
                                      Icons.close,
                                      color: MyColors.blackColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: MyColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: MyColors.colorPrimary),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("$count", style: MyTextStyle.medium.copyWith(fontSize: 100,height: 1)),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical:20.0),
                      child: SizedBox(
                        width: 200,
                        child: Divider(
                          height: 5.0,
                          thickness: 5.0,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PrimaryButton(
                          title: Constants.reset,
                          titleStyle: MyTextStyle.medium.copyWith(fontSize: 20.0,color: Colors.white),
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                          borderColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:10.0),
                          onPressed: (){
                            setState(() {
                              count = 0;
                            });
                          },
                        ),
                        const SizedBox(width: 30.0,),
                        PrimaryButton(
                          title: Constants.addOne,
                          titleStyle: MyTextStyle.medium.copyWith(fontSize: 20.0,color: Colors.white),
                          backgroundColor: MyColors.colorBlue,
                          borderRadius: BorderRadius.circular(10.0),
                          borderColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:10.0),
                          onPressed: (){
                            setState(() {
                              count += 1;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
