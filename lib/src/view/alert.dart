import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'date_time_picker_widget.dart' as ax;

/// iOS风格

///  alert 只有一个
Future<T> showCertainAlert<T>({
  @required BuildContext context,
  String title,
  String message,
  VoidCallback certainCallback,
  String certainText = "确定",
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: (title != null && title?.isNotEmpty) ? Text(title) : null,
          content: (message != null && message?.isNotEmpty)
              ? Text(message)
              : null,
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
Future<T> showAlert<T>({
  @required BuildContext context,
  String title,
  String message,
  VoidCallback certainCallback,
  String certainText = "确定",
  VoidCallback cancelCallback,
  String cancelText = "取消",
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: (title != null && title?.isNotEmpty) ? Text(title) : null,
          content: (message != null && message?.isNotEmpty)
              ? Text(message)
              : null,
          actions: <Widget>[
            _flatButton(
              cancelText,
              style: TextStyle(color: Colors.grey),
              callback: () {
                Navigator.pop(context);
                if (cancelCallback != null) {
                  cancelCallback();
                }
              },
            ),
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
Future<T> showSheet<T>({@required BuildContext context,
  String title,
  String message,
  VoidCallback cancelCallback,
  String cancelText = "取消",
  List<Widget> actions}) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: (title != null && title?.isNotEmpty) ? Text(title) : null,
          message: (message != null && message?.isNotEmpty)
              ? Text(message)
              : null,
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

///  自定义内容sheet
Future<T> showContentSheet<T>(
    {@required BuildContext context, Widget content}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return content;
      });
}

///  时间选择器
Future<T> showDateSheet<T>({
  @required BuildContext context,
}) {
  return showContentSheet(context: context, content: Container(
    height: 300,
    child: ax.DateTimePickerWidget(),
  ));
}

///
_flatButton(String text, {VoidCallback callback, TextStyle style}) {
  return FlatButton(
    child: Text(text, style: style),
    onPressed: callback,
  );
}

