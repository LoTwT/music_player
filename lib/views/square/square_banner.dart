import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/mock/mock.dart';
import 'package:music_player/utils/screen_utils.dart';

class SquareBanner extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final _value = useState(0);

    final prevIndex = (_value.value - 1 + squareBannerItems.length) %
        squareBannerItems.length;
    final currIndex = _value.value;
    final nextIndex = (_value.value + 1) % squareBannerItems.length;

    final W = screen.calc(344);
    final H = screen.calc(438);
    final horOffset = screen.calc(200);

    final sidePreset = {"scale": 0.8, "opacity": 0.5};
    final currPreset = {"scale": 1.0, "opacity": 1.0};
    final otherPreset = {"scale": 0.8, "opacity": 0.0};

    squareBannerItems.sort(
      (item1, item2) {
        double opacity1;
        double opacity2;

        int index1 = item1["index"] as int;
        int index2 = item2["index"] as int;

        if (index1 == prevIndex || index1 == nextIndex)
          opacity1 = sidePreset["opacity"]!;
        else if (index1 == currIndex)
          opacity1 = currPreset["opacity"]!;
        else
          opacity1 = otherPreset["opacity"]!;

        if (index2 == prevIndex || index2 == nextIndex)
          opacity2 = sidePreset["opacity"]!;
        else if (index2 == currIndex)
          opacity2 = currPreset["opacity"]!;
        else
          opacity2 = otherPreset["opacity"]!;

        if (opacity1 < opacity2)
          return -1;
        else if (opacity1 > opacity2)
          return 1;
        else
          return 0;
      },
    );

    return GestureDetector(
      onHorizontalDragEnd: (detail) {
        var dx = detail.velocity.pixelsPerSecond.dx;

        if (dx.abs() >= 50) {
          var length = squareBannerItems.length;

          if (dx < 0)
            _value.value = (_value.value + 1) % length;
          else
            _value.value = (_value.value - 1 + length) % length;
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: screen.calc(38)),
        height: H,
        child: Stack(
          children: squareBannerItems.map(
            (item) {
              var index = item['index'];
              var preset;

              if (index == currIndex)
                preset = currPreset;
              else if (index == prevIndex || index == nextIndex)
                preset = sidePreset;
              else
                preset = otherPreset;

              var offset = Offset(0, 0);
              if (index == prevIndex)
                offset = Offset(-horOffset, 0);
              else if (index == nextIndex) offset = Offset(horOffset, 0);

              return Transform.translate(
                offset: offset,
                child: Transform.scale(
                  scale: preset["scale"],
                  child: Opacity(
                    opacity: preset["opacity"],
                    child: Container(
                      width: W,
                      height: H,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screen.calc(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x66000000),
                            blurRadius: screen.calc(20),
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(screen.calc(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item["img"] as String,
                              width: screen.calc(344),
                              height: screen.calc(344),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screen.calc(18),
                                left: screen.calc(16),
                                right: screen.calc(16),
                              ),
                              child: Text(
                                item["title"] as String,
                                style: TextStyle(fontSize: screen.calc(23)),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
