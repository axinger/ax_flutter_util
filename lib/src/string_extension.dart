import 'reg_exp_extension.dart';

/// 字符串扩展方法
extension StringExtension on String {
  /// 是否是电话号码
  bool get isMobileNumber {
    if (this?.isNotEmpty != true) return false;
//    return RegExp(r'^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0,1,3,5,6,7,8])|(19)[0-9])\d{8}$').hasMatch(this);
    return RegExpExtension.phone.hasMatch(this);
  }
}
