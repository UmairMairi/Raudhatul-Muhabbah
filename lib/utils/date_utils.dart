import 'package:intl/intl.dart';

class DateTimeUtils {
  static const dateFormat = "yyyy-MM-dd hh:mm a'";

  static String formattedDate(
      {DateTime? date, String dateFormat = dateFormat}) {
    try {
      if (date == null) return "N/A";
      return DateFormat(dateFormat).format(date);
    } catch (e) {
      return "N/A";
    }
  }

  static String parseDate({String? date, String dateFormat = dateFormat}) {
    try {
      if (date == null) return "N/A";
      DateTime dateTime = DateTime.parse(date).toLocal();
      return DateFormat(dateFormat).format(dateTime);
    } catch (e) {
      return "N/A";
    }
  }

  static DateTime? addMonths({required DateTime date, int months = 0}) {
    try {
      var newDate = _addMonths(date, months);
      return newDate;
    } catch (e) {
      return null;
    }
  }

  static getDateTimeFromLoop(){
    // Parse the time string
    String timeString = "16:36 (BST)";

    // Extract time and timezone
    String timeWithoutTimeZone = timeString.split(' ')[0]; // "16:36"
    String timeZone = timeString.split('(')[1].replaceAll(')', ''); // "BST"

    // Parse the time
    DateFormat format = DateFormat("HH:mm");
    DateTime time = format.parse(timeWithoutTimeZone);

    // Create a DateTime object at 12:00 with the extracted time and timezone
    DateTime result = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, time.hour, time.minute);

    print(result); // Output: Current date with time 16:36 (BST) converted to 12:00 with the same timezone
  }



  static DateTime _addMonths(DateTime date, int months) {
    // Calculate the target month
    int targetMonth = date.month + months;

    // Calculate the year adjustment
    int yearAdjustment = targetMonth ~/ 12;

    // Calculate the new month and year
    int newMonth = targetMonth % 12;
    int newYear = date.year + yearAdjustment;

    // Handle the case where newMonth is 0 (December)
    if (newMonth == 0) {
      newMonth = 12;
      newYear -= 1;
    }

    // Find the last day of the target month
    int lastDay = DateTime(newYear, newMonth + 1, 0).day;

    // Adjust the day if necessary
    int newDay = date.day > lastDay ? lastDay : date.day;

    // Create the new DateTime
    DateTime newDate = DateTime(newYear, newMonth, newDay, date.hour,
        date.minute, date.second, date.millisecond, date.microsecond);

    return newDate;
  }
}
