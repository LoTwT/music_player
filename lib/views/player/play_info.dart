import 'package:flutter/material.dart';
import 'package:music_player/mock/mock.dart'
    show PlayInfoListInfos1, PlayInfoListInfos2;
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
      height: screen.screenHeight * .75,
      width: screen.screenWidth,
      padding: EdgeInsets.only(
        left: screen.calc(32),
        right: screen.calc(32),
        top: screen.calc(40),
      ),
      decoration: BoxDecoration(
        color: Color(0xfff5f5f5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screen.calc(40)),
          topRight: Radius.circular(screen.calc(40)),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _Header(),
            Padding(
              padding: EdgeInsets.only(top: screen.calc(45)),
            ),
            _List(
              listInfos: PlayInfoListInfos1,
            ),
            Padding(
              padding: EdgeInsets.only(top: screen.calc(16)),
            ),
            _List(
              listInfos: PlayInfoListInfos2,
            ),
            Padding(
              padding: EdgeInsets.only(top: screen.calc(16)),
            ),
            _Footer(),
            Padding(
              padding: EdgeInsets.only(top: screen.calc(40)),
            ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Somewhere only We Know",
                    style: TextStyle(
                      fontSize: screen.calc(24),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: screen.calc(20))),
                  Text(
                    "开通 VIP 畅享千万曲库下载特权",
                    style: TextStyle(
                      fontSize: screen.calc(24),
                      color: Color(0xff959595),
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () => print("vip"),
                child: Container(
                  width: screen.calc(182),
                  height: screen.calc(52),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffea6565),
                      width: screen.calc(2),
                    ),
                    borderRadius: BorderRadius.circular(screen.calc(26)),
                  ),
                  child: Center(
                    child: Text(
                      "开通 VIP 畅享",
                      style: TextStyle(
                        color: Color(0xffea6565),
                        fontSize: screen.calc(22),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: screen.calc(44)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _HeaderButton(
                  title: "收藏",
                  icon: Icon(Icons.create_new_folder_outlined),
                ),
                _HeaderButton(
                  title: "音质: 自动",
                  icon: Icon(Icons.music_note_outlined),
                ),
                _HeaderButton(
                  title: "鲸云音效",
                  icon: Icon(Icons.save_alt_outlined),
                ),
                _HeaderButton(
                  title: "相似推荐",
                  icon: Icon(Icons.adjust_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _List extends StatelessWidget {
  final List<Map> listInfos;

  _List({
    Key? key,
    required this.listInfos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      width: screen.calc(686),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screen.calc(20)),
      ),
      child: Column(
        children: listInfos
            .map(
              (listInfo) => _ListItem(
                text: listInfo["text"],
                icon: listInfo["icon"],
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String text;
  final IconData icon;

  _ListItem({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      height: screen.calc(99),
      padding: EdgeInsets.only(right: screen.calc(66)),
      child: Row(
        children: [
          Container(
            width: screen.calc(108),
            child: Icon(icon),
          ),
          Expanded(
            child: Container(
              height: screen.calc(99),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xffe6e6e6),
                  ),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: screen.calc(32),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
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

    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: screen.calc(99),
        padding: EdgeInsets.only(right: screen.calc(66)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screen.calc(20)),
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

class _HeaderButton extends StatelessWidget {
  final String title;
  final Icon icon;

  _HeaderButton({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Column(
      children: [
        Container(
          width: screen.calc(120),
          height: screen.calc(120),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screen.calc(60)),
          ),
          child: icon,
        ),
        Padding(
          padding: EdgeInsets.only(top: screen.calc(19)),
          child: Text(title),
        )
      ],
    );
  }
}
