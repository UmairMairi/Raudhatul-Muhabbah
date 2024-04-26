import 'package:flutter/material.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';

class MyTextStyle {

  static const inputTitle = TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: MyColors.blackColor);

  static const inputMessage = TextStyle(
      fontFamily: 'Open Sance',
      fontSize: 14,
      height: 1.6,
      fontWeight: FontWeight.normal,
      color: MyColors.blackColor);

  static const textStyle = TextStyle(fontFamily: "Saira");

  static var infoStyle = textStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: MyColors.greyAccent);
  static var textFieldLabelStyle = textStyle.copyWith(fontSize: 15,fontWeight: FontWeight.w400, color: MyColors.blackColor);
  static var textFieldTextStyle = textStyle.copyWith(fontWeight: FontWeight.w400, color: MyColors.blackColor);
  static var textFieldHintTextStyle = textStyle.copyWith(fontWeight: FontWeight.w400, color: MyColors.greyAccent);

  static var appBarTitle = textStyle.copyWith(fontWeight: FontWeight.w600, );
  static var buttonTitle = textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: MyColors.blackColor);
  static var title = textStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w700, color: MyColors.blackColor);
  static var subTitle = textStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w500, color: MyColors.blackColor);
  static var text = textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: MyColors.blackColor);


  static var normal = textStyle.copyWith(fontWeight: FontWeight.w400, color: MyColors.blackColor);
  static var medium = textStyle.copyWith(fontWeight: FontWeight.w600, color: MyColors.blackColor);
  static var bold = textStyle.copyWith(fontWeight: FontWeight.bold, color: MyColors.blackColor);
}
