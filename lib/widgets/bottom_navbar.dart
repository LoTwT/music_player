import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/mock/mock.dart' show BottomNavbarInfos;
import 'package:music_player/utils/screen_utils.dart';

typedef BottomNavbarCallback = void Function(int);

class BottomNavbar extends HookWidget {
  final int value;

  BottomNavbar({
    Key? key,
    this.value = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Hero(
      tag: "_BottomNavbar",
      child: DefaultTextStyle(
        style: TextStyle(inherit: false),
        child: Container(
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
                      isActive: value == index,
                      onTap: () {
                        switch (index) {
                          case 0: // 发现
                            Navigator.pushNamed(context, "/home");
                            break;
                          case 2: // 我的
                            Navigator.pushNamed(context, "/square");
                            break;
                          case 4: // 帐号
                            // todo 判断登录状态
                            Navigator.pushNamed(context, "/login");
                            break;
                        }
                      },
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ),
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
