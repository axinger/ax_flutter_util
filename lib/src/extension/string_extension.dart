import 'package:flutter/foundation.dart';

import 'reg_exp_extension.dart';

/// 字符串扩展方法
extension StringExtension on String {
  /// 是否是电话号码
  bool get isMobileNumber {
    if (this.isNotEmpty != true) return false;
//    return RegExp(r'^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0,1,3,5,6,7,8])|(19)[0-9])\d{8}$').hasMatch(this);
    return RegExpExtension.phone.hasMatch(this);
  }

  /// 不为空
  bool get isNotEmptyOfNull {
    return !this.isEmptyOfNull;
  }

  /// 为空
  bool get isEmptyOfNull {
    return (this == null) || this.isEmpty;
  }
/// 0  78 =>9
  /// 123456
  /// 范围替换保持长度
  String replaceRangeKeepLength({required int prefixCount,required int suffixCount,String symbol = '*'}){

    if(this.length<(prefixCount+suffixCount)){
      return this;
    }
    return  this.replaceRange(prefixCount, this.length-suffixCount, symbol*(this.length-prefixCount-suffixCount));
  }

}
