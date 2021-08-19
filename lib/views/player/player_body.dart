import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

/// 播放主体
class PlayerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      child: Text("player body"),
    );
  }
}
