import 'package:flutter/material.dart';
import 'package:music_player/router/router.dart';

void main() {
  runApp(MyApp());
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
