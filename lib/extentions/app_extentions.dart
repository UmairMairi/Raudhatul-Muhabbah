extension DateTimeExtentions on DateTime? {
  static isActiveDay() {
    var day = DateTime.now().weekday;
    return day >= 4 && day <= 6;
  }

  bool activateTargetForm({required DateTime fajar,required  DateTime duhur}) {
    var day = this?.weekday;
    var now = DateTime.now();
    if(day == 5){
      return true;
    }else if(day == 4){
      return now.isAfter(this!);
    }
    return false;
  }
}
