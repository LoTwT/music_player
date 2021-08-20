import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

void showPlayInfo(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(.3),
    barrierDismissible: false,
    transitionDuration: Duration(microseconds: 100),
    pageBuilder: (context, a1, a2) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: PlayInfo(),
            ),
          ],
        ),
      );
    },
  );
}

class PlayInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      color: Color(0xfff5f5f5),
      height: screen.screenHeight * .75,
      width: screen.screenWidth,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _Header(),
            _List(),
            _List(),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text("Somewhere only We Know"),
                  Text("开通 VIP 畅享千万曲库下载特权"),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(
                  left: screen.calc(10),
                  right: screen.calc(10),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffff3a3a),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(screen.calc(20)),
                ),
                child: Text(
                  "开通 VIP 畅享",
                  style: TextStyle(
                    color: Color(0xffff3a3a),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _HeaderButton(),
              _HeaderButton(),
              _HeaderButton(),
              _HeaderButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ListItem(),
        _ListItem(),
        _ListItem(),
        _ListItem(),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(Icons.person),
          Text("歌手：Keane(基音乐队)"),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        child: Text("关闭"),
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Icon(Icons.create_new_folder_outlined),
        ),
        Text("收藏")
      ],
    );
  }
}
