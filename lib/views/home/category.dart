import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    final categoryList = [
      {"title": "每日推荐", "img": "assets/cate_1.png"},
      {"title": "歌单", "img": "assets/cate_4.png"},
      {"title": "排行榜", "img": "assets/cate_6.png"},
      {"title": "直播", "img": "assets/cate_11.png"},
      {"title": "电台", "img": "assets/cate_22.png"},
      {"title": "火前", "img": "assets/cate_32.png"},
      {"title": "其它", "img": "assets/cate_33.png"},
    ];

    return Container(
      padding: EdgeInsets.only(left: screen.calc(24)),
      margin: EdgeInsets.only(top: screen.calc(32)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categoryList
              .map(
                (category) => GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    "/square",
                    arguments: {"from": category},
                  ),
                  child: Container(
                    margin: EdgeInsets.only(right: screen.calc(29)),
                    width: screen.calc(108),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            width: screen.calc(92),
                            height: screen.calc(92),
                            decoration: BoxDecoration(
                              color: Color(0xfffe271c),
                              borderRadius:
                                  BorderRadius.circular(screen.calc(92 / 2)),
                            ),
                            child: Center(
                              child: Image.asset(
                                category["img"]!,
                                width: screen.calc(48),
                                height: screen.calc(48),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: screen.calc(21)),
                            child: Text(
                              category["title"]!,
                              style: TextStyle(
                                fontSize: screen.calc(23),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
