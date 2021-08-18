import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/mock/mock.dart';
import 'package:music_player/utils/screen_utils.dart';

class SquareBanner extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final _value = useState(0);

    final prev = (_value.value - 1 + squareBannerItems.length) %
            squareBannerItems.length,
        cur = _value.value,
        next = (_value.value + 1) % squareBannerItems.length;

    final W = screen.calc(344),
        H = screen.calc(438),
        offsetH = screen.calc(200),
        offsetV = screen.calc(40);

    Rect prevRect = Rect.fromLTWH(
      (screen.screenWidth - W * .8) / 2 - offsetH,
      offsetV,
      W * .8,
      H * .8,
    );
    Rect curRect = Rect.fromLTWH(
      (screen.screenWidth - W) / 2,
      0,
      W,
      H,
    );
    Rect nextRect = Rect.fromLTWH(
      (screen.screenWidth - W * .8) / 2 + offsetH,
      offsetV,
      W * .8,
      H * .8,
    );
    Rect otherRect = Rect.fromLTWH(
      (screen.screenWidth - W) / 2,
      0,
      W,
      H,
    );

    double prevOpacity = 0.5;
    double curOpacity = 1.0;
    double nextOpacity = 0.5;
    double otherOpacity = 0.0;

    squareBannerItems.sort((item1, item2) {
      double opacity1, opacity2;

      if (item1['index'] == prev)
        opacity1 = prevOpacity;
      else if (item1['index'] == cur)
        opacity1 = curOpacity;
      else if (item1['index'] == next)
        opacity1 = nextOpacity;
      else
        opacity1 = otherOpacity;

      if (item2['index'] == prev)
        opacity2 = prevOpacity;
      else if (item2['index'] == cur)
        opacity2 = curOpacity;
      else if (item2['index'] == next)
        opacity2 = nextOpacity;
      else
        opacity2 = otherOpacity;

      if (opacity1 < opacity2)
        return -1;
      else if (opacity1 > opacity2)
        return 1;
      else
        return 0;
    });

    return Container(
      margin: EdgeInsets.only(top: screen.calc(38)),
      width: screen.screenWidth,
      height: H,
      child: Stack(
        children: squareBannerItems.map(
          (item) {
            Rect rect;
            double opacity;
            var index = item['index'];

            if (index == cur) {
              rect = curRect;
              opacity = curOpacity;
            } else if (index == prev) {
              rect = prevRect;
              opacity = prevOpacity;
            } else if (index == next) {
              rect = nextRect;
              opacity = nextOpacity;
            } else {
              rect = otherRect;
              opacity = otherOpacity;
            }

            return Positioned(
              left: rect.left,
              top: rect.top,
              child: Opacity(
                opacity: opacity,
                child: Container(
                  width: rect.width,
                  height: rect.height,
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(
                    child: Text(
                      item['title'] as String,
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
