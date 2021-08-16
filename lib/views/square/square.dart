import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = ScreenUtils(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screen.screenPaddingTop + screen.calc(8)),
        child: Column(
          children: [
            Text("广场"),
          ],
        ),
      ),
    );
  }
}
