import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/views/home/category.dart';
import 'package:music_player/views/home/header.dart';
import 'package:music_player/views/home/swiper.dart';
import 'package:music_player/widgets/bottom_navbar.dart';
import 'package:music_player/widgets/recommend_list.dart';
import 'package:music_player/widgets/song_list.dart';
import 'package:music_player/mock/mock.dart' show songs, recommend_songs;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

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
      bottomNavigationBar: BottomNavbar(value: 0),
    );
  }
}
