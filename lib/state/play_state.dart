import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/utils/player_utils.dart';

/// 全局播放状态
class PlayState extends InheritedWidget {
  final bool isPlaying;
  final int currentTime;
  final int totalTime;
  final AudioPlayer player;

  PlayState({
    Key? key,
    required Widget child,
    required this.player,
    required this.isPlaying,
    required this.currentTime,
    required this.totalTime,
  }) : super(key: key, child: child);

  static PlayState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PlayState>()!;

  @override
  bool updateShouldNotify(PlayState oldWidget) {
    // 返回值为 true 表示应该更新
    return isPlaying != oldWidget.isPlaying ||
        currentTime != oldWidget.currentTime ||
        totalTime != oldWidget.totalTime;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return """
isPlaying: $isPlaying
currentTime: $currentTime
totalTime: $totalTime
    """;
  }
}

class PlayStateProvider extends StatefulWidget {
  final Widget child;

  PlayStateProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayStateProviderState(child: child);
}

class _PlayStateProviderState extends State {
  Widget child;
  late AudioPlayer player;

  bool isPlaying = false;
  int currentTime = 0;
  int totalTime = 0;

  _PlayStateProviderState({
    required this.child,
  }) : super() {
    player = usePlayer();

    // 播放状态
    player.onPlayerStateChanged.listen(
      (event) => setState(
        () => isPlaying = event == PlayerState.PLAYING,
      ),
    );
    // 已播时长
    player.onAudioPositionChanged
        .listen((event) => setState(() => currentTime = event.inSeconds));
    // 总时长
    player.onDurationChanged
        .listen((event) => setState(() => totalTime = event.inSeconds));
  }

  @override
  Widget build(BuildContext context) {
    return PlayState(
      child: child,
      isPlaying: isPlaying,
      currentTime: currentTime,
      totalTime: totalTime,
      player: player,
    );
  }
}
