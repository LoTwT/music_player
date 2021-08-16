import 'package:flutter/material.dart';
import 'package:music_player/views/home/home.dart';
import 'package:music_player/views/splash/splash.dart';

final routes = {
  "/": (BuildContext context) => Splash(),
  "/home": (BuildContext context) => Home(),
};