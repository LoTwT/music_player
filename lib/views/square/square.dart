import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/mock/mock.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/utils/system_utils.dart';
import 'package:music_player/views/square/square_banner.dart';
import 'package:music_player/views/square/square_category.dart';
import 'package:music_player/views/square/square_header.dart';
import 'package:music_player/views/square/square_list.dart';
import 'package:music_player/widgets/bottom_navbar.dart';

class Square extends HookWidget {
  @override
  Widget build(BuildContext context) {
    setStatusBarStyle(Brightness.light);
    final screen = ScreenUtils(context);
    final currentSquareCategoryId =
        useState(SquareCategoryItems[0]["id"] as int);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Container(
            height: screen.calc(860),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff959a99), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: screen.screenPaddingTop + screen.calc(8),
            ),
            child: Column(
              children: [
                SquareHeader(),
                SquareCategory(
                  currentId: currentSquareCategoryId.value,
                  squareCategoryItems: SquareCategoryItems,
                  onChanged: (id) => currentSquareCategoryId.value = id,
                ),
                SquareBanner(),
                SquareList(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavbar(value: 2),
    );
  }
}
