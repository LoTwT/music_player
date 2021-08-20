import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

/// 播放进度条
class PlayerProgress extends StatelessWidget {
  final int totalTime;
  final int currentTime;

  PlayerProgress({
    Key? key,
    required this.currentTime,
    required this.totalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    final totolTimeToShow =
        "${(totalTime ~/ 60).toString().padLeft(2, '0')}:${(totalTime % 60).toString().padLeft(2, '0')}";
    final currentTimeToShow =
        "${(currentTime ~/ 60).toString().padLeft(2, '0')}:${(currentTime % 60).toString().padLeft(2, '0')}";

    final W = 558.0;
    final curWidth =
        totalTime == 0 ? 0.0 : screen.calc(currentTime / totalTime * (W - 18));

    return Container(
      margin: EdgeInsets.only(top: screen.calc(12)),
      height: screen.calc(30),
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white.withOpacity(.6),
          fontSize: screen.calc(28),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: screen.calc(28)),
              child: Text(currentTimeToShow),
            ),
            Expanded(
              child: Container(
                height: screen.calc(30),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: screen.calc(W),
                        margin: EdgeInsets.only(
                          left: screen.calc(9),
                          right: screen.calc(9),
                        ),
                        height: screen.calc(4),
                        color: Colors.white.withOpacity(.6),
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.white,
                              width: curWidth,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: curWidth,
                      top: screen.calc(6),
                      child: Container(
                        width: screen.calc(16),
                        height: screen.calc(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            screen.calc(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: screen.calc(28)),
              child: Text(totolTimeToShow),
            ),
          ],
        ),
      ),
    );
  }
}
