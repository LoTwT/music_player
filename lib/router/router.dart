import 'package:flutter/material.dart';
import 'package:music_player/views/home/home.dart';
import 'package:music_player/views/login/login.dart';
import 'package:music_player/views/player/player.dart';
import 'package:music_player/views/splash/splash.dart';
import 'package:music_player/views/square/square.dart';

final routes = {
  "/": (BuildContext context) => Splash(),
  "/home": (BuildContext context) => Home(),
  "/square": (BuildContext context) => Square(),
  "/player": (BuildContext context) => MusicPlayer(),
  "/login": (BuildContext context) => Login(),
};
