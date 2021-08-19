import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

/// 播放页头部
class PlayerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      height: screen.calc(98),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              child: Image.asset(
                "assets/icon-left-arrow-w.png",
                width: screen.calc(48),
                height: screen.calc(48),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: screen.calc(16)),
              child: Column(
                children: [
                  Text(
                    "Somewhere Only We know",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screen.calc(30),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screen.calc(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Keane",
                          style: TextStyle(color: Color(0x99ffffff)),
                        ),
                        Image.asset(
                          "assets/icon-right-arrow-w.png",
                          width: screen.calc(20),
                          height: screen.calc(20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Image.asset(
              "assets/icon-share-w.png",
              width: screen.calc(48),
              height: screen.calc(48),
            ),
          ),
        ],
      ),
    );
  }
}
