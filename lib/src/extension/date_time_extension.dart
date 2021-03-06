//
//  date_time_extension
//  ax_flutter_demo
//
//  Created by axinger on 2020/8/20 8:05 下午 .
//  Copyright ©2020/8/20 ax_flutter_demo. All rights reserved.
//
import 'package:intl/intl.dart';

const String yyyyMMddHHmmssS = 'yyyy-MM-dd HH:mm:ss.S';
const String yyyyMMddHHmmss = 'yyyy-MM-dd HH:mm:ss';
const String yyyyMMdd = 'yyyy-MM-dd';

/// 周几
const String E = 'E';

extension DateTimeExtension on DateTime {
  String format({
    String format = yyyyMMddHHmmss,
    String? locale,
  }) {
    return DateFormat(format, locale).format(this);
  }
}

//main() {
//  print(DateTime.now().format(yyyyMMddHHmmssS));
//  print(DateTime.now().format(yyyyMMddHHmmss));
//  print(DateTime.now().format(yyyyMMdd));
//
//  print(DateTime.now().format('E'));
//  print(DateTime.now().format('j'));
//  print(DateTime.now().format('MM'));
//  var format = DateFormat.jm();
//  var dateString = format.format(DateTime.now());
//  print(dateString);
//}
