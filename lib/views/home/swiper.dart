import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/utils/screen_utils.dart';

class Swiper extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var screen = ScreenUtils(context);
    // swiperImage 路径
    final swiperImages = [
      "assets/tmp_slider_1.png",
      "assets/tmp_slider_2.png",
      "assets/tmp_slider_3.png"
    ];
    // 当前 swiper
    final currentSwiper = useState(0);

    final double dotSize = 12;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: screen.calc(40)),
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (val, _reason) {
                currentSwiper.value = val;
              },
              height: screen.calc(268),
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: swiperImages
                .map(
                  (swiperImage) => Builder(
                    builder: (context) => Image.asset(
                      swiperImage,
                      width: screen.calc(686),
                      height: screen.calc(268),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Positioned(
          bottom: screen.calc(32),
          left: (screen.screenWidth -
                  screen.calc(dotSize + 8) * swiperImages.length) /
              2,
          child: Container(
            child: Row(
              children: swiperImages
                  .asMap()
                  .map(
                    (index, item) => MapEntry(
                        index,
                        Container(
                          width: screen.calc(dotSize),
                          height: screen.calc(dotSize),
                          margin: EdgeInsets.only(
                            left: screen.calc(4),
                            right: screen.calc(4),
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screen.calc(dotSize / 2)),
                            color: index == currentSwiper.value
                                ? Color(0xffff3a3a)
                                : Color(0xaaffffff),
                          ),
                        )),
                  )
                  .values
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
