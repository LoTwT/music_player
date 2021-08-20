import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:music_player/state/play_state.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/utils/system_utils.dart';
import 'package:music_player/views/player/play_info.dart';
import 'package:music_player/views/player/play_list.dart';
import 'package:music_player/views/player/player_interactive.dart';
import 'package:music_player/views/player/player_body.dart';
import 'package:music_player/views/player/player_control.dart';
import 'package:music_player/views/player/player_header.dart';
import 'package:music_player/views/player/player_progress.dart';

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setStatusBarStyle(Brightness.light);
    final screen = ScreenUtils(context);

    // final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;

    final playState = PlayState.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/tmp_cover_7.jpg",
            height: screen.screenHeight,
            fit: BoxFit.fill,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: screen.screenPaddingTop,
              left: screen.calc(24),
              right: screen.calc(24),
            ),
            child: Column(
              children: [
                PlayerHeader(),
                PlayerBody(isPlaying: playState.isPlaying),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: screen.screenWidth,
            child: Container(
              child: Column(
                children: [
                  PlayerInteractive(
                    onDetail: () => showPlayInfo(context),
                  ),
                  PlayerProgress(
                    currentTime: playState.currentTime,
                    totalTime: playState.totalTime,
                  ),
                  PlayerControl(
                    isPlaying: playState.isPlaying,
                    onPlay: () {
                      if (playState.isPlaying == false)
                        playState.player
                            .play("http://172.16.84.38:5000/keqing.mp3");
                      else
                        playState.player.pause();
                    },
                    onPlaylist: () => showPlayList(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
