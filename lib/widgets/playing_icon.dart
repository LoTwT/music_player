import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

class PlayingIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      width: screen.calc(60),
      height: screen.calc(60),
      decoration: BoxDecoration(
        border: Border.all(
          width: screen.calc(3),
          color: Color(0xffe5e5e5),
        ),
        borderRadius: BorderRadius.circular(
          screen.calc(30),
        ),
        image: DecorationImage(
          image: AssetImage(
            "assets/tmp_icon_music.png",
          ),
        ),
      ),
    );
  }
}
