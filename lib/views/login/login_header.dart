import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

class LoginHeader extends StatelessWidget {
  final String title;

  LoginHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Hero(
      tag: "LoginHeader",
      child: Container(
        height: screen.calc(88),
        child: Row(
          children: [
            Container(
              width: screen.calc(100),
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    inherit: false,
                    color: Color(0xff333333),
                    fontSize: screen.calc(34),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: screen.calc(100),
            ),
          ],
        ),
      ),
    );
  }
}
