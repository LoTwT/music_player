import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/widgets/img_button.dart';
import 'package:music_player/widgets/player_panel_item.dart';

/// 播放控制栏
class PlayerControl extends StatelessWidget {
  final VoidCallback? onBackward;
  final VoidCallback? onForward;
  final VoidCallback? onPlaylist;
  final bool isPlaying;
  final VoidCallback? onPlay;

  PlayerControl({
    Key? key,
    this.onBackward,
    this.onForward,
    this.onPlaylist,
    this.onPlay,
    this.isPlaying = false,
  }) : super(key: key);

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
          // 循环方式
          PlayerPanelItem(
            iconPath: "assets/icon-playloop-w.png",
            width: screen.calc(55),
            height: screen.calc(55),
          ),
          // 前一首
          ImgButton(
            iconPath: "assets/icon-backward-w.png",
            onTap: onBackward,
            width: screen.calc(55),
            height: screen.calc(55),
          ),
          // 播放 & 暂停
          GestureDetector(
            onTap: onPlay,
            child: Container(
              width: screen.calc(120),
              height: screen.calc(120),
              decoration: BoxDecoration(
                border: Border.all(
                  width: screen.calc(2),
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(screen.calc(60)),
              ),
              child: isPlaying
                  ? PlayerPanelItem(
                      iconPath: "assets/icon-pause-w.png",
                      width: screen.calc(55),
                      height: screen.calc(55),
                    )
                  : PlayerPanelItem(
                      iconPath: "assets/icon-play-w.png",
                      width: screen.calc(55),
                      height: screen.calc(55),
                    ),
            ),
          ),
          // 后一首
          ImgButton(
            iconPath: "assets/icon-forward-w.png",
            onTap: onForward,
            width: screen.calc(55),
            height: screen.calc(55),
          ),
          // 播放列表
          ImgButton(
            iconPath: "assets/icon-playlist-w.png",
            onTap: onPlaylist,
            width: screen.calc(55),
            height: screen.calc(55),
          )
        ],
      ),
    );
  }
}
