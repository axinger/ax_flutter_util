import 'package:flutter/services.dart';

import '../../ax_flutter_util.dart';

extension WhitelistingTextInputFormatterExtension on WhitelistingTextInputFormatter {
  /// 中国电话
  static final WhitelistingTextInputFormatter chinesePhone =
      WhitelistingTextInputFormatter(RegExpExtension.phone);


}
