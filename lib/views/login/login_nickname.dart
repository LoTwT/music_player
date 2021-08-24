import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/views/login/login_header.dart';
import 'package:music_player/widgets/round_flat_button.dart';

typedef NicknameCallback = void Function(String);

/// 登录昵称页
class LoginNickname extends HookWidget {
  final NicknameCallback onNickname;

  LoginNickname({
    Key? key,
    required this.onNickname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final nickname = useState("");

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: screen.screenPaddingTop,
          left: screen.calc(32),
          right: screen.calc(32),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginHeader(title: "给自己取一个昵称"),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/login_img_1.png",
                      width: screen.calc(344),
                      height: screen.calc(311),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screen.calc(30)),
                      child: Text(
                        "你希望大家怎么称呼你呢？",
                        style: TextStyle(
                          fontSize: screen.calc(26),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screen.calc(60)),
                child: Column(
                  children: [
                    Container(
                      height: screen.calc(92),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: screen.calc(1),
                            color: Color(0xffe6e6e6),
                          ),
                        ),
                      ),
                      child: TextField(
                        onChanged: (val) => nickname.value = val,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "请输入昵称",
                          hintStyle: TextStyle(
                            color: Color(0xffe6e6e6),
                          ),
                        ),
                        cursorColor: Color(0xff808080),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screen.calc(21)),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_outlined,
                      size: screen.calc(28),
                      color: Color(0xffc2473a),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screen.calc(14)),
                      child: Text(
                        "昵称已被注册，请换一个",
                        style: TextStyle(
                          color: Color(0xffea4d44),
                          fontSize: screen.calc(22),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RoundFlatButton(
                width: screen.calc(686),
                height: screen.calc(80),
                bgColor: Color(0xffeb5443),
                child: Text(
                  "完成",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                disabled: nickname.value.length < 6,
                onTap: () => onNickname(nickname.value),
              )
            ],
          ),
        ),
      ),
    );
  }
}
