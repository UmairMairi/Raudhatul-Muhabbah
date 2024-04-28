import 'package:http/http.dart' as http;
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';

extension ResponseExtention on http.Response {
  bool isSuccessful() {
    if((statusCode >= 200 && statusCode <= 300)){
      body.printSuccess();
      return true;
    }else{
      body.printFailure();
      return false;
    }
  }

  bool isLMSSuccessful() {
    if((statusCode >= 200 && statusCode <= 300)){
      body.printSuccess();
      return true;
    }else{
      body.printFailure();
      return false;
    }
  }
}
