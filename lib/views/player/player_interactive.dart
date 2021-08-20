import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/widgets/img_button.dart';
import 'package:music_player/widgets/player_panel_item.dart';

/// 交互功能栏
class PlayerInteractive extends StatelessWidget {
  final isFavourite;
  final VoidCallback? onFavourite;
  final VoidCallback? onDownload;
  final VoidCallback? onBell;

  PlayerInteractive({
    Key? key,
    this.isFavourite = false,
    this.onFavourite,
    this.onDownload,
    this.onBell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      margin: EdgeInsets.only(bottom: screen.calc(14)),
      height: screen.calc(55),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: onFavourite,
            child: isFavourite
                ? PlayerPanelItem(
                    iconPath: "assets/icon-heart-w-fill.png",
                    width: screen.calc(55),
                    height: screen.calc(55),
                  )
                : PlayerPanelItem(
                    iconPath: "assets/icon-heart-w.png",
                    width: screen.calc(55),
                    height: screen.calc(55),
                  ),
          ),
          ImgButton(
            iconPath: "assets/icon-download-w.png",
            onTap: onDownload,
            width: screen.calc(55),
            height: screen.calc(55),
          ),
          ImgButton(
            iconPath: "assets/icon-bell-w.png",
            onTap: onBell,
            width: screen.calc(55),
            height: screen.calc(55),
          ),
          PlayerPanelItem(
            iconPath: "assets/icon-message-w.png",
            width: screen.calc(55),
            height: screen.calc(55),
          ),
          PlayerPanelItem(
            iconPath: "assets/icon-3dot-w.png",
            width: screen.calc(55),
            height: screen.calc(55),
          ),
        ],
      ),
    );
  }
}
