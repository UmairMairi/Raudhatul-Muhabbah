import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

extension DoubleExtention on String {
  Future<void> launch() async {
    if (await canLaunchUrl(Uri.parse(this))){
      if (!await launchUrl(Uri.parse(this))) {
        if (kDebugMode) {
          print("TAG---------------> Unable to launch URL $this");
        }
      }
    }else{
      if (kDebugMode) {
        print("TAG---------------> Unable to launch URL $this");
      }
    }
  }
}
