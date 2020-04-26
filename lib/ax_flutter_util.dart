library ax_flutter_util;
export 'src/ax_logger.dart';
export 'src/phone_text_input_formatter.dart';
export 'src/reg_exp_extension.dart';
export 'src/string_extension.dart';
export 'src/key_chain.dart';

import 'dart:async';
import 'package:flutter/services.dart';

class AxFlutterUtil {
  static const MethodChannel _channel =
      const MethodChannel('ax_flutter_util');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
