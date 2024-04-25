class Singleton {
  static final Singleton _singleton = Singleton._internal();
  static const bool isDev = false;

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}
