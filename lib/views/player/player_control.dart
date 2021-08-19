import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/widgets/player_panel_item.dart';

/// 播放控制栏
class PlayerControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      margin: EdgeInsets.only(
        bottom: screen.calc(32),
        top: screen.calc(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PlayerPanelItem(icon: "assets/icon-playloop-w.png"),
          PlayerPanelItem(icon: "assets/icon-backward-w.png"),
          Container(
            width: screen.calc(120),
            height: screen.calc(120),
            decoration: BoxDecoration(
              border: Border.all(
                width: screen.calc(2),
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(screen.calc(60)),
            ),
            child: PlayerPanelItem(icon: "assets/icon-pause-w.png"),
          ),
          PlayerPanelItem(icon: "assets/icon-forward-w.png"),
          PlayerPanelItem(icon: "assets/icon-playlist-w.png"),
        ],
      ),
    );
  }
}
