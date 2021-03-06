import '../extension/reg_exp_extension.dart';
import 'package:flutter/services.dart';

/// 电话号码匹配
class PhoneTextInputFormatter extends TextInputFormatter {
  /// Creates a formatter that allows only the insertion of whitelisted characters patterns.
  ///
  /// The [whitelistedPattern] must not be null.
  PhoneTextInputFormatter(this.whitelistedPattern)
      : assert(whitelistedPattern != null);

  /// A [Pattern] to extract all instances of allowed characters.
  ///
  /// [RegExp] with multiple groups is not supported.
  final Pattern whitelistedPattern;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    return _selectionAwareTextManipulation(
      newValue,
      (String substring) {
        return whitelistedPattern
            .allMatches(substring)
            .map<String>((Match match) => match.group(0)!)
            .join();
      },
    );
  }

  /// A [WhitelistingTextInputFormatter] that takes in digits `[0-9]` only.
  static final PhoneTextInputFormatter digitsOnly =
      PhoneTextInputFormatter(RegExpExtension.phone);
}

TextEditingValue _selectionAwareTextManipulation(
  TextEditingValue value,
  String substringManipulation(String substring),
) {
  final int selectionStartIndex = value.selection.start;
  final int selectionEndIndex = value.selection.end;
  String manipulatedText;
  TextSelection manipulatedSelection = const TextSelection.collapsed(offset: -1);
  if (selectionStartIndex < 0 || selectionEndIndex < 0) {
    manipulatedText = substringManipulation(value.text);
  } else {
    final String beforeSelection =
        substringManipulation(value.text.substring(0, selectionStartIndex));
    final String inSelection = substringManipulation(
        value.text.substring(selectionStartIndex, selectionEndIndex));
    final String afterSelection =
        substringManipulation(value.text.substring(selectionEndIndex));
    manipulatedText = beforeSelection + inSelection + afterSelection;
    if (value.selection.baseOffset > value.selection.extentOffset) {
      manipulatedSelection = value.selection.copyWith(
        baseOffset: beforeSelection.length + inSelection.length,
        extentOffset: beforeSelection.length,
      );
    } else {
      manipulatedSelection = value.selection.copyWith(
        baseOffset: beforeSelection.length,
        extentOffset: beforeSelection.length + inSelection.length,
      );
    }
  }
  return TextEditingValue(
    text: manipulatedText,
    selection:
        manipulatedSelection,
    composing:
        manipulatedText == value.text ? value.composing : TextRange.empty,
  );
}
