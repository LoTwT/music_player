import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 设置系统状态栏样式
void setStatusBarStyle(Brightness iconstyle) {
  try {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          // android 系统状态栏透明
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: iconstyle,
        ),
      );
    }
  } catch (e) {
    print(e);
  }
}
