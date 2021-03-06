import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    Timer(Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, "/home"));

    return Container(
      decoration: BoxDecoration(
        color: Color(0xffc93e2d),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Image.asset("assets/splash_logo.png"),
            left: screen.calc(150),
            top: screen.calc(300),
            width: screen.calc(450),
            height: screen.calc(89),
          ),
          Positioned(
            child: Image.asset("assets/splash_logo_sm.png"),
            left: screen.calc(264),
            bottom: screen.calc(41),
            width: screen.calc(222),
            height: screen.calc(51),
          )
        ],
      ),
    );
  }
}
