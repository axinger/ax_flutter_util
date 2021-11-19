import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'date_time_picker_widget.dart' as ax;

/// iOS风格

///  alert 只有一个
Future<T?> showCupertinoCertainAlert<T>({
  required BuildContext context,
  String title = '',
  String message = '',
  VoidCallback? certainCallback,
  String certainText = "确定",
}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog(
          title: (title.isNotEmpty) ? Text(title) : null,
          content: (message.isNotEmpty) ? Text(message) : null,
          actions: <Widget>[
            _flatButton(
              certainText,
              style: TextStyle(color: Colors.deepPurple),
              callback: () {
                Navigator.pop(context);
                if (certainCallback != null) {
                  certainCallback();
                }
              },
            ),
          ],
        );
      });
}

///  alert
Future<bool?> showCupertinoAlert({
  required BuildContext context,
  String title = '',
  String message = '',
  VoidCallback? certainCallback,
  String certainText = "确定",
  VoidCallback? cancelCallback,
  String cancelText = "取消",
}) {
  return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog(
          title: (title.isNotEmpty) ? Text(title) : null,
          content: (message.isNotEmpty) ? Text(message) : null,
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                cancelText,
              ),
              onPressed: () {
                Navigator.pop(context, false);
                if (cancelCallback != null) {
                  cancelCallback();
                }
              },
            ),
            CupertinoDialogAction(
              child: Text(certainText),
              onPressed: () {
                Navigator.pop(context, true);
                if (certainCallback != null) {
                  certainCallback();
                }
              },
            ),
          ],
        );
      });
}

// ignore: slash_for_doc_comments
/**
    CupertinoActionSheetAction(
    child: Text("相机"),
    onPressed: () {
    Navigator.pop(context);
    },
    ),
 **/

///  sheet
Future<T?> showCupertinoSheet<T>({
  required BuildContext context,
  String title = '',
  String message = '',
  VoidCallback? cancelCallback,
  String cancelText = "取消",
  List<CupertinoActionSheetAction>? actions,
}) {
  return showCupertinoModalPopup(
      context: context,
      semanticsDismissible: true,
      builder: (context) {
        return CupertinoActionSheet(
          title: (title.isNotEmpty) ? Text(title) : null,
          message: (message.isNotEmpty) ? Text(message) : null,
          cancelButton: CupertinoActionSheetAction(
            child: Text(cancelText),
            onPressed: () {
              Navigator.pop(context);
              if (cancelCallback != null) {
                cancelCallback();
              }
            },
          ),
          actions: actions,
        );
      });
}

/// 底部弹出,可以滚动的
/// [context] context
/// [child] 子视图
/// [isScroll] 文本输入,是否全部滚动
/// [isRoundedCorners] 是否需要圆角,圆角需要backgroundColor透明
Future<T?> showScrollSheet<T>({
  required BuildContext context,
  required Widget child,
  bool isScroll = false,
  bool isRoundedCorners = false,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: isScroll, // !important
    backgroundColor: isRoundedCorners ? Colors.transparent : null, // 圆角
    builder: (BuildContext context) {
      if (!isScroll) return child;
      // !important
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom), // !important
          child: child,
        ),
      );
    },
  );
}

///  自定义内容sheet
Future<T?> showContentSheet<T>({
  required BuildContext context,
  required Widget content,
}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return content;
      });
}

///  时间选择器
Future<T?> showDateSheet<T>({
  required BuildContext context,
}) {
  return showContentSheet(
      context: context,
      content: Container(
        height: 300,
//        child: ax.DateTimePickerWidget(),
      ));
}

///
_flatButton(
  String text, {
  VoidCallback? callback,
  TextStyle? style,
}) {
  return FlatButton(
    child: Text(text, style: style),
    onPressed: callback,
  );
}
