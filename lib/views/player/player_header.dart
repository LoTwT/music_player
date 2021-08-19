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
          Container(
            child: Text("left"),
          ),
          Expanded(
            child: Text("center"),
          ),
          Container(
            child: Text("right"),
          ),
        ],
      ),
    );
  }
}
