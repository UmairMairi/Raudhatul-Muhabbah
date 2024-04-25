import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/screens/widgets/btn_primary.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';

class WidgetFunction {
  static AppBar awnAppBar(
      {Widget? leading,
      String? leadingSvg,
      Function()? leadingOnpress,
      EdgeInsetsGeometry? leadingPadding,
      List<Widget>? actions,
      bool centerTitle = false,
      String? title,
      Color? titleColor,
      Color? backgroundColor}) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: backgroundColor ?? Colors.white,
      surfaceTintColor: Colors.transparent,
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      title: (title != null)
          ? Text(
              title,
              style: MyTextStyle.appBarTitle
                  .copyWith(color: titleColor ?? Colors.black),
            )
          : null,
    );
  }

  static Future<dynamic> showAlertDialog(
      {Function()? onPressed,
      String? titleText,
      EdgeInsetsGeometry? titlePadding,
      String? infoText,
      String? buttonText,
      bool isCancelable = true,
      Widget? icon,
      Widget? extraDetails,
      TextStyle? titleStyle,
      TextStyle? infoTextStyle,
      EdgeInsetsGeometry? contentPadding,
      TextStyle? buttonTextStyle}) async {
    var result = await Get.dialog(
      barrierColor: Colors.grey.withOpacity(0.6),
      barrierDismissible: isCancelable,
      PopScope(
        canPop: isCancelable,
        child: SimpleDialog(
          titlePadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 32),
          contentPadding: contentPadding ?? const EdgeInsets.all(15),
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 2, color: Colors.white)),
          children: [
            Container(
              constraints: const BoxConstraints(minWidth: 2000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) icon,
                  if (titleText != null)
                    Padding(
                      padding: titlePadding ??
                          const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        titleText,
                        style: infoTextStyle ?? MyTextStyle.bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  if (infoText != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      child: Text(
                        infoText,
                        style: infoTextStyle ?? MyTextStyle.normal,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  if (extraDetails != null) extraDetails,
                  if (onPressed != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: PrimaryButton(
                        onPressed: onPressed,
                        textColor: MyColors.whiteColor,
                        borderColor: Colors.transparent,
                        backgroundColor: MyColors.colorPrimary,
                        title: buttonText ?? "Verify",
                        titleStyle: MyTextStyle.buttonTitle.copyWith(color: MyColors.whiteColor),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
    return result;
  }
}
