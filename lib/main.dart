import 'package:flutter/material.dart';
import 'package:music_player/router/router.dart';
import 'package:music_player/state/play_state.dart';
import 'package:music_player/utils/system_utils.dart';

void main() {
  runApp(
    PlayStateProvider(
      child: MyApp(),
    ),
  );

  setStatusBarStyle(Brightness.light);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      routes: routes,
      initialRoute: "/",
    );
  }
}
