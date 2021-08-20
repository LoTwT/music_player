import 'package:flutter/material.dart';
import 'package:music_player/widgets/player_panel_item.dart';

const DisabledOpacity = .5;

class ImgButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final double width;
  final double height;

  ImgButton({
    Key? key,
    required this.iconPath,
    this.onTap,
    this.width = 48,
    this.height = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onTap != null
        ? GestureDetector(
            onTap: onTap,
            child: PlayerPanelItem(
              iconPath: iconPath,
              width: width,
              height: height,
            ),
          )
        : Opacity(
            opacity: DisabledOpacity,
            child: PlayerPanelItem(
              iconPath: iconPath,
              width: width,
              height: height,
            ),
          );
  }
}
