import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

class PlayerPanelItem extends StatelessWidget {
  final icon;

  PlayerPanelItem({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Center(
      child: Image.asset(
        icon,
        width: screen.calc(55),
        height: screen.calc(55),
      ),
    );
  }
}
