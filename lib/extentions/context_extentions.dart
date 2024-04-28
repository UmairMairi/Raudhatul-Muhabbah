import 'package:flutter/material.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';

extension DoubleExtention on BuildContext {
  Future<dynamic> showBottomSheet({
    Function(String)? onProceed,
    bool isCancellable = true,
    Widget? child,
    Color barrierColor = MyColors.whiteColor,
  }) async {
    var result = await showModalBottomSheet(
        context: this,
        isScrollControlled: true,
        isDismissible: isCancellable,
        barrierColor: barrierColor.withOpacity(0.2),
        enableDrag: true,
        backgroundColor: MyColors.backgroundColor,
        builder: (BuildContext context) {
          return PopScope(
              canPop: isCancellable,
              child: child ?? Container()
          );
        });
    return result;
  }
}
