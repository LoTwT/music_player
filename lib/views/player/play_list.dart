import 'package:flutter/material.dart';
import 'package:music_player/mock/mock.dart';
import 'package:music_player/utils/screen_utils.dart';

void showPlayList(BuildContext context) {
  final screen = ScreenUtils(context);

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(.3),
    barrierLabel: "PlayList",
    transitionDuration: Duration(milliseconds: 100),
    pageBuilder: (context, a1, a2) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              bottom: screen.calc(52),
              left: screen.calc(30),
              child: Container(
                width: screen.calc(690),
                height: screen.calc(908),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screen.calc(46)),
                ),
                child: Column(
                  children: [
                    _Header(),
                    _PlayList(),
                    _Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      padding: EdgeInsets.only(
        left: screen.calc(32),
        right: screen.calc(32),
        bottom: screen.calc(26),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screen.calc(38)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "当前播放",
                    style: TextStyle(
                      fontSize: screen.calc(36),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: " (85)",
                    style: TextStyle(
                      fontSize: screen.calc(32),
                      color: Color(0xff999999),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screen.calc(26)),
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.loop,
                    color: Color(0xff999999),
                  ),
                  Text("列表循环"),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.create_new_folder_outlined,
                    color: Color(0xff999999),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screen.calc(32)),
                    child: Text("收藏全部"),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 2,
                      color: Color(0xffe6e6e6),
                    ),
                  ),
                ),
                padding: EdgeInsets.only(left: screen.calc(30)),
                child: Icon(
                  Icons.delete_outline,
                  color: Color(0xff999999),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final borderColor = Color(0xffe6e6e6);

    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: screen.calc(112),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
        ),
        child: Center(
          child: Text(
            "关闭",
            style: TextStyle(
              fontSize: screen.calc(32),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: screen.calc(32),
            right: screen.calc(32),
          ),
          child: Column(
            children: recommend_songs
                .map(
                  (song) => _PlayListItem(
                    title: song["title"]!,
                    artist: song["artist"]!,
                    isActive: song["id"] == "1",
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _PlayListItem extends StatelessWidget {
  final String title;
  final String artist;
  final bool isActive;

  _PlayListItem({
    Key? key,
    required this.title,
    required this.artist,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      height: screen.calc(89),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: screen.calc(1),
            color: Color(0xffe6e6e6),
          ),
        ),
      ),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    fontSize: screen.calc(26),
                    fontWeight: FontWeight.w700,
                    color: isActive ? Color(0xffeb534c) : Color(0xff333333),
                  ),
                ),
                TextSpan(
                  text: " - $artist",
                  style: TextStyle(
                    fontSize: screen.calc(24),
                    color: isActive ? Color(0xffeb534c) : Color(0xff666666),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.close,
            color: Color(0xff999999),
          ),
        ],
      ),
    );
  }
}
