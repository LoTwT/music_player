import 'package:flutter/material.dart';
import 'package:music_player/state/play_state.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/widgets/arc_progress.dart';

class PlayingIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final iconSize = screen.calc(60);
    final borderWidth = screen.calc(3);

    final playState = PlayState.of(context);
    double percent = 0.0;
    if (playState.totalTime != 0)
      percent = playState.currentTime / playState.totalTime;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/player"),
      child: Hero(
        tag: "PlayingIcon",
        child: Container(
          width: iconSize,
          height: iconSize,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 3, top: 3),
                width: iconSize - 6,
                height: iconSize - 6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/tmp_icon_music.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(iconSize / 2),
                ),
              ),
              Positioned.fill(
                child: ArcProgress(
                  percent: percent,
                  width: borderWidth,
                  color: Color(0xffff3a3a),
                  bgColor: Color(0xffe5e5e5),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
