import 'package:flutter/material.dart';

// 设计图宽度
const _width = 750;

class ScreenUtils {
  late MediaQueryData _screen;
  // 屏幕宽度
  late double _screenWidth;
  // 屏幕高度
  late double _screenHeight;
  // 系统状态栏高度
  late double _screenPaddingTop;

  ScreenUtils(BuildContext context) {
    _screen = MediaQuery.of(context);

    _screenWidth = _screen.size.width;
    _screenHeight = _screen.size.height;
    _screenPaddingTop = _screen.padding.top;
  }

  double calc(double value) {
    return value * _screenWidth / _width;
  }

  double get screenWidth {
    return _screenWidth;
  }

  double get screenHeight {
    return _screenHeight;
  }

  double get screenPaddingTop {
    return _screenPaddingTop;
  }
}
