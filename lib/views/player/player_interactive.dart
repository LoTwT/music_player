import 'package:flutter/material.dart';
import 'package:music_player/mock/mock.dart' show PlayerInteractiveIcons;
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/widgets/player_panel_item.dart';

/// 交互功能栏
class PlayerInteractive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      margin: EdgeInsets.only(bottom: screen.calc(14)),
      height: screen.calc(55),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: PlayerInteractiveIcons.map(
          (icon) => PlayerPanelItem(icon: icon),
        ).toList(),
      ),
    );
  }
}
