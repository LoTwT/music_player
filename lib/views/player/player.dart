import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/utils/system_utils.dart';
import 'package:music_player/views/player/player_%20interactive.dart';
import 'package:music_player/views/player/player_body.dart';
import 'package:music_player/views/player/player_control.dart';
import 'package:music_player/views/player/player_header.dart';
import 'package:music_player/views/player/player_progress.dart';

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    setStatusBarStyle(Brightness.light);

    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: screen.screenPaddingTop,
          left: screen.calc(24),
          right: screen.calc(24),
        ),
        decoration: BoxDecoration(
          color: Color(0x99000000),
        ),
        child: Column(
          children: [
            PlayerHeader(),
            PlayerBody(),
            PlayerInteractive(),
            PlayerProgress(),
            PlayerControl(),
          ],
        ),
      ),
    );
  }
}
