import 'package:flutter/services.dart';

/**
 *  TextField(
    inputFormatters: [
    NumLengthInputFormatter(decimalLength: 8, integerLength: 2),
    ],
    ),
 */

/// TextField限制输入整数位数和小数位数
class NumLengthInputFormatter extends TextInputFormatter {
  int decimalLength = -1;
  int integerLength = -1;
  bool allowInputDecimal = false;

  NumLengthInputFormatter({
    this.decimalLength = 2,
    this.integerLength = 8,
  }) : super();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String value = newValue.text;
    int selectionIndex = newValue.selection.end;
    if (newValue.text.contains('.')) {
      int pointIndex = newValue.text.indexOf('.');
      String beforePoint = newValue.text.substring(0, pointIndex);
      print('$beforePoint');
      //小数点前内容大于integerLength
      if (beforePoint.length > integerLength) {
        value = oldValue.text;
        selectionIndex = oldValue.selection.end;
      } else
      //小数点前内容小于等于integerLength
      {
        String afterPoint =
            newValue.text.substring(pointIndex + 1, newValue.text.length);
        if (afterPoint.length > decimalLength) {
          value = oldValue.text;
          selectionIndex = oldValue.selection.end;
        }
      }
    } else {
      if (newValue.text.length > integerLength) {
        value = oldValue.text;
        selectionIndex = oldValue.selection.end;
      }
    }
    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
