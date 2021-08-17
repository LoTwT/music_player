import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/views/square/square_banner.dart';
import 'package:music_player/views/square/square_category.dart';
import 'package:music_player/views/square/square_header.dart';
import 'package:music_player/views/square/square_list.dart';
import 'package:music_player/widgets/bottom_navbar.dart';

class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = ScreenUtils(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screen.screenPaddingTop + screen.calc(8)),
        child: Column(
          children: [
            SquareHeader(),
            SquareCategory(),
            SquareBanner(),
            SquareList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(value: 2),
    );
  }
}
