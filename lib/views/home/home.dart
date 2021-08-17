import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/views/home/category.dart';
import 'package:music_player/views/home/header.dart';
import 'package:music_player/views/home/swiper.dart';
import 'package:music_player/widgets/bottom_navbar.dart';
import 'package:music_player/widgets/recommend_list.dart';
import 'package:music_player/widgets/song_list.dart';

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final currentBottomNav = useState(0);

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
                  songs: songs,
                ),
                RecommendList(
                  title: "根据 Red Dawn (a) 推荐",
                  onMore: () => Navigator.pushNamed(context, "/square"),
                  songs: recommend_songs,
                  onPlay: (id) => print("song played, id: $id"),
                ),
                Container(
                  margin: EdgeInsets.only(top: screen.calc(100)),
                  height: screen.calc(50),
                  child: Text("已经到底了~~~"),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        value: currentBottomNav.value,
        onChanged: (index) => currentBottomNav.value = index,
      ),
    );
  }
}

const songs = [
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
    "title": "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  },
  {"id": "4", "img": "assets/tmp_cover_4.jpg", "count": "434", "title": "bbb"},
  {"id": "5", "img": "assets/tmp_cover_5.jpg", "count": "59亿", "title": "ccc"},
  {"id": "6", "img": "assets/tmp_cover_6.jpg", "count": "2342", "title": "ddd"}
];

const recommend_songs = [
  {
    "id": "1",
    "img": "assets/tmp_cover_1.jpg",
    "title": "Tempest",
    "artist": "Capo Productions",
    "tip": "你到不了的地方 音乐能带你到"
  },
  {
    "id": "2",
    "img": "assets/tmp_cover_2.jpg",
    "title": "aaa",
    "artist": "bbb",
    "tip": "sadfasdf"
  },
  {
    "id": "3",
    "img": "assets/tmp_cover_3.jpg",
    "title": "asdf",
    "artist": "gfhjgf",
    "tip": "fghjgfhjgfhjfghj"
  },
  {
    "id": "4",
    "img": "assets/tmp_cover_4.jpg",
    "title": "dfvccbnvc",
    "artist": "rthfghdfg",
    "tip": "shsghsgfh"
  },
  {
    "id": "5",
    "img": "assets/tmp_cover_5.jpg",
    "title": "5",
    "artist": "5",
    "tip": "5"
  },
  {
    "id": "6",
    "img": "assets/tmp_cover_6.jpg",
    "title": "6",
    "artist": "6",
    "tip": "6"
  },
];
