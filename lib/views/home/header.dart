import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/widgets/playing_icon.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = ScreenUtils(context);

    return Container(
      padding: EdgeInsets.only(
        left: screen.calc(24),
        right: screen.calc(24),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: screen.calc(16)),
            child: Image.asset(
              "assets/header_icon_music.png",
              width: screen.calc(72),
              height: screen.calc(72),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: screen.calc(72),
                  padding: EdgeInsets.only(
                    left: screen.calc(30),
                    right: screen.calc(30),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xfff7f7f7),
                    borderRadius: BorderRadius.circular(screen.calc(36)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    width: screen.calc(520),
                    height: screen.calc(72),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: Color(0xff949494),
                          ),
                          Text(
                            "NightWish",
                            style: TextStyle(
                              color: Color(0xffc5c5c5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: screen.calc(32)),
            child: PlayingIcon(),
          ),
        ],
      ),
    );
  }
}
