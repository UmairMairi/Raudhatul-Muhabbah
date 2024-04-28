

class Singleton {
  static final Singleton _singleton = Singleton._internal();
  static String? token;

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}
