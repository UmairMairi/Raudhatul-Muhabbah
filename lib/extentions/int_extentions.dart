
import 'package:intl/intl.dart';

extension IntExtention on int? {
  String format() {
    NumberFormat formatter = NumberFormat("###,###,###.##", "en_US");
    String formattedNumber = formatter.format(this);
    return formattedNumber;
  }
}