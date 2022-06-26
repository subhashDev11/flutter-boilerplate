import 'package:logger/logger.dart';

class AppLogger {
  static final Logger appLogger = Logger();

  static e(String e) {
    appLogger.e(e);
  }

  static d(String d) {
    appLogger.d(d);
  }

  static i(String i) {
    appLogger.i(i);
  }
}
