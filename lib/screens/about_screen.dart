import 'package:flutter/material.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/constants.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  static const String tag = "/about_screen";

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Constants.aboutTitle, style: MyTextStyle.title),
            const SizedBox(height: 20.0,),
            Text(Constants.aboutInfo, textAlign: TextAlign.center,style: MyTextStyle.normal.copyWith(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
