import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/utils/screen_utils.dart';

typedef BottomNavbarCallback = void Function(int);
const BottomNavbarInfos = <Map>[
  {
    "imgPath": "assets/icon-music-acc-b.png",
    "activeImgPath": "assets/icon-music-acc.png",
    "title": "发现",
  },
  {
    "imgPath": "assets/icon-video-b.png",
    "activeImgPath": "assets/icon-video.png",
    "title": "视频",
  },
  {
    "imgPath": "assets/icon-music-b.png",
    "activeImgPath": "assets/icon-music.png",
    "title": "我的",
  },
  {
    "imgPath": "assets/icon-group-b.png",
    "activeImgPath": "assets/icon-group.png",
    "title": "云村",
  },
  {
    "imgPath": "assets/icon-person-b.png",
    "activeImgPath": "assets/icon-person.png",
    "title": "帐号",
  },
];

class BottomNavbar extends HookWidget {
  final int value;
  final BottomNavbarCallback onChanged;

  BottomNavbar({
    Key? key,
    required this.onChanged,
    this.value = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      height: screen.calc(100),
      padding: EdgeInsets.only(top: screen.calc(10)),
      decoration: BoxDecoration(color: Color(0x66ffffff)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: BottomNavbarInfos.asMap()
            .map(
              (index, info) => MapEntry(
                index,
                _BottomNavbarItem(
                  imgPath: info["imgPath"],
                  activeImgPath: info["activeImgPath"],
                  title: info["title"],
                  onTap: () => onChanged(index),
                  isActive: value == index,
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}

class _BottomNavbarItem extends StatelessWidget {
  final String imgPath;
  final String activeImgPath;
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  _BottomNavbarItem({
    Key? key,
    required this.imgPath,
    required this.title,
    required this.activeImgPath,
    required this.onTap,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              width: screen.calc(56),
              height: screen.calc(56),
              decoration: BoxDecoration(
                gradient: isActive
                    ? LinearGradient(
                        colors: [
                          Color(0xffff584a),
                          Color(0xffff1f14),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                    : null,
                borderRadius: BorderRadius.circular(screen.calc(28)),
              ),
              child: Center(
                child: Image.asset(
                  isActive ? activeImgPath : imgPath,
                  width: screen.calc(30),
                  height: screen.calc(30),
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: isActive ? Color(0xffff1f14) : Color(0xff969696),
                fontSize: screen.calc(17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
