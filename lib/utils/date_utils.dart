import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
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

  static Future<void> isActiveTime() async {
    var position = await _determinePosition();
    var lat = position.latitude;
    var lng = position.longitude;

    final myCoordinates = Coordinates(lat,lng); // Replace with your own location lat, lng.
    final params = CalculationMethod.other.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    var dateTimeFajr = prayerTimes.fajr.toLocal().toString();
    var dateTimeDhuhr = prayerTimes.dhuhr.toLocal().toString();
    var dateTimeAsr = prayerTimes.asr.toLocal().toString();
    var dateTimeMaghrib = prayerTimes.maghrib.toLocal().toString();
    var dateTimeIsha = prayerTimes.isha.toLocal().toString();
    if (kDebugMode) {
      print("DateTime------------->$dateTimeFajr");
      print("DateTime------------->$dateTimeDhuhr");
      print("DateTime------------->$dateTimeAsr");
      print("DateTime------------->$dateTimeMaghrib");
      print("DateTime------------->$dateTimeIsha");
    }
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

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

// Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
// Location services are not enabled don't continue
// accessing the position and request users of the
// App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
// Permissions are denied, next time you could try
// requesting permissions again (this is also where
// Android's shouldShowRequestPermissionRationale
// returned true. According to Android guidelines
// your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
// Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

// When we reach here, permissions are granted and we can
// continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
