import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/mock/mock.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/views/square/square_banner.dart';
import 'package:music_player/views/square/square_category.dart';
import 'package:music_player/views/square/square_header.dart';
import 'package:music_player/views/square/square_list.dart';
import 'package:music_player/widgets/bottom_navbar.dart';

class Square extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final currentSquareCategoryId =
        useState(SquareCategoryItems[0]["id"] as int);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screen.screenPaddingTop + screen.calc(8)),
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
      ),
      bottomNavigationBar: BottomNavbar(value: 2),
    );
  }
}
