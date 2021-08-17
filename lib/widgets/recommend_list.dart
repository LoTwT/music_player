import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

typedef PlayCallback = void Function(String);

class RecommendList extends StatelessWidget {
  final String title;
  final VoidCallback onMore;
  final List<Map> songs;
  final PlayCallback onPlay;

  RecommendList({
    Key? key,
    required this.title,
    required this.onMore,
    required this.songs,
    required this.onPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      margin: EdgeInsets.only(top: screen.calc(70)),
      child: Column(
        children: [
          _Header(
            title: title,
            onMore: onMore,
          ),
          _Body(
            songs: songs,
            onPlay: onPlay,
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final VoidCallback onMore;

  _Header({
    Key? key,
    required this.title,
    required this.onMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      padding: EdgeInsets.only(
        left: screen.calc(32),
        right: screen.calc(32),
      ),
      height: screen.calc(52),
      child: Row(
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: screen.calc(34),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: onMore,
            child: Container(
              padding: EdgeInsets.only(
                left: screen.calc(24),
                right: screen.calc(24),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffe7e7e7),
                  width: screen.calc(2),
                ),
                borderRadius: BorderRadius.circular(screen.calc(52 / 2)),
              ),
              child: Row(
                children: [
                  Icon(Icons.play_arrow),
                  Text("播放全部"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final List<Map> songs;
  final PlayCallback onPlay;

  _Body({
    Key? key,
    required this.songs,
    required this.onPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    // 切割 songs
    final columns = <List<dynamic>>[];
    for (var i = 0; i < songs.length; i += 3) {
      columns.add(songs.sublist(i, i + 3));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.only(
          top: screen.calc(4),
          left: screen.calc(32),
        ),
        child: Row(
          children: columns
              .map<Widget>(
                (column) => Column(
                  children: column
                      .map<Widget>(
                        (song) => _Item(song: song, onPlay: onPlay),
                      )
                      .toList(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final Map song;
  final PlayCallback onPlay;

  _Item({
    Key? key,
    required this.song,
    required this.onPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      width: screen.calc(640),
      height: screen.calc(120),
      padding: EdgeInsets.only(top: screen.calc(20)),
      margin: EdgeInsets.only(right: screen.calc(45)),
      child: Row(
        children: [
          Container(
            width: screen.calc(120),
            height: screen.calc(120),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(song["img"]),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: screen.calc(20),
                top: screen.calc(24),
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "${song["title"]} "),
                        TextSpan(
                          text: " -  ${song["artist"]}",
                          style: TextStyle(color: Color(0xff9a9a9a)),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: screen.calc(4),
                          right: screen.calc(4),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffff3a3a),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(screen.calc(8)),
                        ),
                        child: Text(
                          "SQ",
                          style: TextStyle(
                            color: Color(0xffff3a3a),
                            fontSize: screen.calc(20),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: screen.calc(8)),
                        child: Text(
                          song["tip"],
                          style: TextStyle(color: Color(0xff9a9a9a)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onPlay(song["id"]),
            child: Container(
              child: Center(
                child: Container(
                  width: screen.calc(50),
                  height: screen.calc(50),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffe6e6e6),
                      width: screen.calc(2),
                    ),
                    borderRadius: BorderRadius.circular(screen.calc(25)),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    size: screen.calc(30),
                    color: Color(0xffff3a3a),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
