import 'package:flutter/material.dart';

class Utils {
  static getDialog(String msg, context) {
    return AlertDialog(
      title: Text("点击提示"),
      content: SingleChildScrollView(
          child: new ListBody(
        children: <Widget>[new Text("你点击了Item" + msg)],
      )),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("取消"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("确定"),
        )
      ],
    );
  }
}
