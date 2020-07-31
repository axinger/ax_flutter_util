extension RegExpExtension on RegExp {
  static RegExp get phone {
    ///r的意思是不转义
    /// 比如 r'\d+'   \d 数字  + 出现至少1次
    return RegExp(
        r'^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0,1,3,5,6,7,8])|(19)[0-9])\d{8}$');
  }
}
