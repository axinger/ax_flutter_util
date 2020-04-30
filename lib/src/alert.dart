import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'date_time_picker_widget.dart' as ax;

/// iOS风格
class Alert {
  static _flatButton(String text, {VoidCallback callback, TextStyle style}) {
    return FlatButton(
      child: Text(text, style: style),
      onPressed: callback,
    );
  }

  ///  alert
  static showAlert({
    @required BuildContext context,
    title = "",
    message = "",
    VoidCallback certainCallback,
    String certainText = "确定",
    VoidCallback cancelCallback,
    String cancelText = "取消",
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
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
  static showSheet({@required BuildContext context,
    String title = "",
    String message = "",
    VoidCallback cancelCallback,
    String cancelText = "取消",
    List<Widget> actions}) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text(title),
            message: Text(message),
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
  static showContentSheet({@required BuildContext context, Widget content}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return content;
        });
  }

  ///  时间选择器
  static showDateSheet({
    @required BuildContext context,
  }) {
    showContentSheet(context: context, content: Container(
      height: 300,
      child: ax.DateTimePickerWidget(),
    ));
  }
}
