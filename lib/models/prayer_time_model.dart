// To parse this JSON data, do
//
//     final prayerTimeModel = prayerTimeModelFromJson(jsonString);

import 'dart:convert';

PrayerTimeModel prayerTimeModelFromJson(String str) => PrayerTimeModel.fromJson(json.decode(str));

String prayerTimeModelToJson(PrayerTimeModel data) => json.encode(data.toJson());

class PrayerTimeModel {
  final int? code;
  final String? status;
  final List<Datum>? data;

  PrayerTimeModel({
    this.code,
    this.status,
    this.data,
  });

  PrayerTimeModel copyWith({
    int? code,
    String? status,
    List<Datum>? data,
  }) =>
      PrayerTimeModel(
        code: code ?? this.code,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) => PrayerTimeModel(
    code: json["code"],
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final Timings? timings;
  final Date? date;
  final Meta? meta;

  Datum({
    this.timings,
    this.date,
    this.meta,
  });

  Datum copyWith({
    Timings? timings,
    Date? date,
    Meta? meta,
  }) =>
      Datum(
        timings: timings ?? this.timings,
        date: date ?? this.date,
        meta: meta ?? this.meta,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    timings: json["timings"] == null ? null : Timings.fromJson(json["timings"]),
    date: json["date"] == null ? null : Date.fromJson(json["date"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "timings": timings?.toJson(),
    "date": date?.toJson(),
    "meta": meta?.toJson(),
  };
}

class Date {
  final String? readable;
  final String? timestamp;
  final Gregorian? gregorian;
  final Hijri? hijri;

  Date({
    this.readable,
    this.timestamp,
    this.gregorian,
    this.hijri,
  });

  Date copyWith({
    String? readable,
    String? timestamp,
    Gregorian? gregorian,
    Hijri? hijri,
  }) =>
      Date(
        readable: readable ?? this.readable,
        timestamp: timestamp ?? this.timestamp,
        gregorian: gregorian ?? this.gregorian,
        hijri: hijri ?? this.hijri,
      );

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    readable: json["readable"],
    timestamp: json["timestamp"],
    gregorian: json["gregorian"] == null ? null : Gregorian.fromJson(json["gregorian"]),
    hijri: json["hijri"] == null ? null : Hijri.fromJson(json["hijri"]),
  );

  Map<String, dynamic> toJson() => {
    "readable": readable,
    "timestamp": timestamp,
    "gregorian": gregorian?.toJson(),
    "hijri": hijri?.toJson(),
  };
}

class Gregorian {
  final String? date;
  final String? format;
  final String? day;
  final GregorianWeekday? weekday;
  final GregorianMonth? month;
  final String? year;
  final Designation? designation;

  Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
  });

  Gregorian copyWith({
    String? date,
    String? format,
    String? day,
    GregorianWeekday? weekday,
    GregorianMonth? month,
    String? year,
    Designation? designation,
  }) =>
      Gregorian(
        date: date ?? this.date,
        format: format ?? this.format,
        day: day ?? this.day,
        weekday: weekday ?? this.weekday,
        month: month ?? this.month,
        year: year ?? this.year,
        designation: designation ?? this.designation,
      );

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
    date: json["date"],
    format: json["format"],
    day: json["day"],
    weekday: json["weekday"] == null ? null : GregorianWeekday.fromJson(json["weekday"]),
    month: json["month"] == null ? null : GregorianMonth.fromJson(json["month"]),
    year: json["year"],
    designation: json["designation"] == null ? null : Designation.fromJson(json["designation"]),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "format": format,
    "day": day,
    "weekday": weekday?.toJson(),
    "month": month?.toJson(),
    "year": year,
    "designation": designation?.toJson(),
  };
}

class Designation {
  final String? abbreviated;
  final String? expanded;

  Designation({
    this.abbreviated,
    this.expanded,
  });

  Designation copyWith({
    String? abbreviated,
    String? expanded,
  }) =>
      Designation(
        abbreviated: abbreviated ?? this.abbreviated,
        expanded: expanded ?? this.expanded,
      );

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
    abbreviated: json["abbreviated"],
    expanded: json["expanded"],
  );

  Map<String, dynamic> toJson() => {
    "abbreviated": abbreviated,
    "expanded": expanded,
  };
}

class GregorianMonth {
  final int? number;
  final String? en;

  GregorianMonth({
    this.number,
    this.en,
  });

  GregorianMonth copyWith({
    int? number,
    String? en,
  }) =>
      GregorianMonth(
        number: number ?? this.number,
        en: en ?? this.en,
      );

  factory GregorianMonth.fromJson(Map<String, dynamic> json) => GregorianMonth(
    number: json["number"],
    en: json["en"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "en": en,
  };
}

class GregorianWeekday {
  final String? en;

  GregorianWeekday({
    this.en,
  });

  GregorianWeekday copyWith({
    String? en,
  }) =>
      GregorianWeekday(
        en: en ?? this.en,
      );

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) => GregorianWeekday(
    en: json["en"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
  };
}

class Hijri {
  final String? date;
  final String? format;
  final String? day;
  final HijriWeekday? weekday;
  final HijriMonth? month;
  final String? year;
  final Designation? designation;
  final List<dynamic>? holidays;

  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
  });

  Hijri copyWith({
    String? date,
    String? format,
    String? day,
    HijriWeekday? weekday,
    HijriMonth? month,
    String? year,
    Designation? designation,
    List<dynamic>? holidays,
  }) =>
      Hijri(
        date: date ?? this.date,
        format: format ?? this.format,
        day: day ?? this.day,
        weekday: weekday ?? this.weekday,
        month: month ?? this.month,
        year: year ?? this.year,
        designation: designation ?? this.designation,
        holidays: holidays ?? this.holidays,
      );

  factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
    date: json["date"],
    format: json["format"],
    day: json["day"],
    weekday: json["weekday"] == null ? null : HijriWeekday.fromJson(json["weekday"]),
    month: json["month"] == null ? null : HijriMonth.fromJson(json["month"]),
    year: json["year"],
    designation: json["designation"] == null ? null : Designation.fromJson(json["designation"]),
    holidays: json["holidays"] == null ? [] : List<dynamic>.from(json["holidays"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "format": format,
    "day": day,
    "weekday": weekday?.toJson(),
    "month": month?.toJson(),
    "year": year,
    "designation": designation?.toJson(),
    "holidays": holidays == null ? [] : List<dynamic>.from(holidays!.map((x) => x)),
  };
}

class HijriMonth {
  final int? number;
  final String? en;
  final String? ar;

  HijriMonth({
    this.number,
    this.en,
    this.ar,
  });

  HijriMonth copyWith({
    int? number,
    String? en,
    String? ar,
  }) =>
      HijriMonth(
        number: number ?? this.number,
        en: en ?? this.en,
        ar: ar ?? this.ar,
      );

  factory HijriMonth.fromJson(Map<String, dynamic> json) => HijriMonth(
    number: json["number"],
    en: json["en"],
    ar: json["ar"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "en": en,
    "ar": ar,
  };
}

class HijriWeekday {
  final String? en;
  final String? ar;

  HijriWeekday({
    this.en,
    this.ar,
  });

  HijriWeekday copyWith({
    String? en,
    String? ar,
  }) =>
      HijriWeekday(
        en: en ?? this.en,
        ar: ar ?? this.ar,
      );

  factory HijriWeekday.fromJson(Map<String, dynamic> json) => HijriWeekday(
    en: json["en"],
    ar: json["ar"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
    "ar": ar,
  };
}

class Meta {
  final double? latitude;
  final double? longitude;
  final String? timezone;
  final Method? method;
  final String? latitudeAdjustmentMethod;
  final String? midnightMode;
  final String? school;
  final Map<String, int>? offset;

  Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  Meta copyWith({
    double? latitude,
    double? longitude,
    String? timezone,
    Method? method,
    String? latitudeAdjustmentMethod,
    String? midnightMode,
    String? school,
    Map<String, int>? offset,
  }) =>
      Meta(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        timezone: timezone ?? this.timezone,
        method: method ?? this.method,
        latitudeAdjustmentMethod: latitudeAdjustmentMethod ?? this.latitudeAdjustmentMethod,
        midnightMode: midnightMode ?? this.midnightMode,
        school: school ?? this.school,
        offset: offset ?? this.offset,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    timezone: json["timezone"],
    method: json["method"] == null ? null : Method.fromJson(json["method"]),
    latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
    midnightMode: json["midnightMode"],
    school: json["school"],
    offset: Map.from(json["offset"]!).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "timezone": timezone,
    "method": method?.toJson(),
    "latitudeAdjustmentMethod": latitudeAdjustmentMethod,
    "midnightMode": midnightMode,
    "school": school,
    "offset": Map.from(offset!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Method {
  final int? id;
  final String? name;
  final Params? params;
  final Location? location;

  Method({
    this.id,
    this.name,
    this.params,
    this.location,
  });

  Method copyWith({
    int? id,
    String? name,
    Params? params,
    Location? location,
  }) =>
      Method(
        id: id ?? this.id,
        name: name ?? this.name,
        params: params ?? this.params,
        location: location ?? this.location,
      );

  factory Method.fromJson(Map<String, dynamic> json) => Method(
    id: json["id"],
    name: json["name"],
    params: json["params"] == null ? null : Params.fromJson(json["params"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "params": params?.toJson(),
    "location": location?.toJson(),
  };
}

class Location {
  final double? latitude;
  final double? longitude;

  Location({
    this.latitude,
    this.longitude,
  });

  Location copyWith({
    double? latitude,
    double? longitude,
  }) =>
      Location(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Params {
  final int? fajr;
  final int? isha;

  Params({
    this.fajr,
    this.isha,
  });

  Params copyWith({
    int? fajr,
    int? isha,
  }) =>
      Params(
        fajr: fajr ?? this.fajr,
        isha: isha ?? this.isha,
      );

  factory Params.fromJson(Map<String, dynamic> json) => Params(
    fajr: json["Fajr"],
    isha: json["Isha"],
  );

  Map<String, dynamic> toJson() => {
    "Fajr": fajr,
    "Isha": isha,
  };
}

class Timings {
  final String? fajr;
  final String? sunrise;
  final String? dhuhr;
  final String? asr;
  final String? sunset;
  final String? maghrib;
  final String? isha;
  final String? imsak;
  final String? midnight;
  final String? firstthird;
  final String? lastthird;

  Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  Timings copyWith({
    String? fajr,
    String? sunrise,
    String? dhuhr,
    String? asr,
    String? sunset,
    String? maghrib,
    String? isha,
    String? imsak,
    String? midnight,
    String? firstthird,
    String? lastthird,
  }) =>
      Timings(
        fajr: fajr ?? this.fajr,
        sunrise: sunrise ?? this.sunrise,
        dhuhr: dhuhr ?? this.dhuhr,
        asr: asr ?? this.asr,
        sunset: sunset ?? this.sunset,
        maghrib: maghrib ?? this.maghrib,
        isha: isha ?? this.isha,
        imsak: imsak ?? this.imsak,
        midnight: midnight ?? this.midnight,
        firstthird: firstthird ?? this.firstthird,
        lastthird: lastthird ?? this.lastthird,
      );

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
    fajr: json["Fajr"],
    sunrise: json["Sunrise"],
    dhuhr: json["Dhuhr"],
    asr: json["Asr"],
    sunset: json["Sunset"],
    maghrib: json["Maghrib"],
    isha: json["Isha"],
    imsak: json["Imsak"],
    midnight: json["Midnight"],
    firstthird: json["Firstthird"],
    lastthird: json["Lastthird"],
  );

  Map<String, dynamic> toJson() => {
    "Fajr": fajr,
    "Sunrise": sunrise,
    "Dhuhr": dhuhr,
    "Asr": asr,
    "Sunset": sunset,
    "Maghrib": maghrib,
    "Isha": isha,
    "Imsak": imsak,
    "Midnight": midnight,
    "Firstthird": firstthird,
    "Lastthird": lastthird,
  };
}
