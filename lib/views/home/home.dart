import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/views/home/category.dart';
import 'package:music_player/views/home/header.dart';
import 'package:music_player/views/home/swiper.dart';
import 'package:music_player/widgets/song_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = ScreenUtils(context);

    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(
          color: Color(0xff333333),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.only(top: screen.screenPaddingTop + screen.calc(8)),
            child: Column(
              children: [
                Header(),
                Swiper(),
                Category(),
                SongList(
                  title: "你的歌单精选站",
                  onMore: () => Navigator.pushNamed(context, "/square"),
                  songs: [
                    {
                      "id": "1",
                      "img": "assets/tmp_cover_1.jpg",
                      "count": "9亿",
                      "title": "[华语新歌] 最新华语音乐专辑"
                    },
                    {
                      "id": "2",
                      "img": "assets/tmp_cover_2.jpg",
                      "count": "19亿",
                      "title": "今天从《Titan》听起 | 私人雷达"
                    },
                    {
                      "id": "3",
                      "img": "assets/tmp_cover_3.jpg",
                      "count": "39亿",
                      "title":
                          "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    },
                    {
                      "id": "4",
                      "img": "assets/tmp_cover_4.jpg",
                      "count": "434",
                      "title": "bbb"
                    },
                    {
                      "id": "5",
                      "img": "assets/tmp_cover_5.jpg",
                      "count": "59亿",
                      "title": "ccc"
                    },
                    {
                      "id": "6",
                      "img": "assets/tmp_cover_6.jpg",
                      "count": "2342",
                      "title": "ddd"
                    },
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
