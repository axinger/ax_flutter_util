import 'package:logger/logger.dart';

//Logger get AxLogger{
//  return Logger();
//}
class AxLogger {
  AxLogger.info(dynamic message, [dynamic error, StackTrace stackTrace]) {
    Logger().i(message);
  }

  AxLogger.warning(dynamic message, [dynamic error, StackTrace stackTrace]) {
    Logger().w(message);
  }
}
