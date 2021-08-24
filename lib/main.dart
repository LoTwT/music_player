import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:music_player/router/router.dart';
import 'package:music_player/state/store.dart';
import 'package:music_player/state/play_state.dart';
import 'package:music_player/utils/system_utils.dart';

void main() {
  runApp(
    StoreProvider<StoreState>(
      store: createStore(),
      child: PlayStateProvider(
        child: MyApp(),
      ),
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
