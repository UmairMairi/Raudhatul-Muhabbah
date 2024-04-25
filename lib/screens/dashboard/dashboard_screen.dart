import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/signup_screen.dart';
import 'package:raudhatul_muhabbah/screens/widgets/TextFieldPrimary.dart';
import 'package:raudhatul_muhabbah/screens/widgets/btn_primary.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String tag = "/dashboard_screen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.appLogo,height: 200,width: 200,),
            Text(Constants.info,style: MyTextStyle.normal.copyWith(color: MyColors.greyAccent,fontWeight: FontWeight.w600,fontSize: 18),),
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
              height: 20.0,
            ),
            Row(
              children: [
                const Spacer(),
                PrimaryButton(
                  title: Constants.notAccountInfo,
                  backgroundColor: Colors.transparent,
                  borderColor: Colors.transparent,
                  textColor:  MyColors.colorBlue,
                  onPressed: (){
                    Get.toNamed(SignupScreen.tag);
                  },
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
