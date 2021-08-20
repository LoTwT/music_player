import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/utils/screen_utils.dart';

/// 播放主体
class PlayerBody extends HookWidget {
  final bool isPlaying;

  PlayerBody({
    Key? key,
    required this.isPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final deg = useState<double>(0.0);

    Timer(Duration(milliseconds: 16), () {
      if (isPlaying) deg.value += 0.5;
    });

    return Container(
      height: screen.calc(800),
      child: Stack(
        children: [
          // 唱片
          Positioned(
            top: screen.calc(182),
            left: screen.calc(42),
            child: Transform.rotate(
              angle: deg.value * pi / 180,
              child: Container(
                width: screen.calc(618),
                height: screen.calc(618),
                child: Stack(
                  children: [
                    // 封面
                    Center(
                      child: Container(
                        color: Colors.black,
                        child: Image.asset(
                          "assets/tmp_cover_7.jpg",
                          width: screen.calc(400),
                          height: screen.calc(400),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Image.asset("assets/player-disc.png"),
                    )
                  ],
                ),
              ),
            ),
          ),
          // arm
          Positioned(
            left: screen.calc(331),
            top: screen.calc(24),
            child: Transform.rotate(
              origin: Offset(
                screen.calc(-131),
                screen.calc(-78),
              ),
              angle: isPlaying ? 28 * pi / 180 : 0,
              child: Image.asset(
                "assets/player-arm.png",
                width: screen.calc(314),
                height: screen.calc(198),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
