import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = ScreenUtils(context);
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screen.screenPaddingTop + screen.calc(8)),
        child: Column(
          children: [
            Text("广场"),
            Text(arguments["from"].toString()),
          ],
        ),
      ),
    );
  }
}
