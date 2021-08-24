import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/views/login/login_header.dart';
import 'package:music_player/widgets/round_flat_button.dart';

typedef PasswordCallback = void Function(String);

/// 登录密码页
class LoginPassword extends HookWidget {
  final PasswordCallback onPassword;

  LoginPassword({
    Key? key,
    required this.onPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final password = useState("");

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: screen.screenPaddingTop,
          left: screen.calc(32),
          right: screen.calc(32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginHeader(title: "重设密码"),
            Padding(
              padding: EdgeInsets.only(top: screen.calc(90)),
              child: Text(
                "设置密码后，可使用手机号 + 密码登录",
                style: TextStyle(
                  fontSize: screen.calc(26),
                ),
              ),
            ),
            Container(
              height: screen.calc(84),
              margin: EdgeInsets.only(top: screen.calc(66)),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: screen.calc(1),
                    color: Color(0xffcccccc),
                  ),
                ),
              ),
              child: TextField(
                obscureText: true,
                onChanged: (val) => password.value = val,
                style: TextStyle(
                  fontSize: screen.calc(32),
                ),
                decoration: InputDecoration(
                  hintText: "设置登录密码，不少于 6 位",
                  hintStyle: TextStyle(
                    color: Color(0xffcccccc),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screen.calc(81)),
              child: RoundFlatButton(
                width: screen.calc(686),
                height: screen.calc(80),
                bgColor: Color(0xffeb5443),
                child: Text(
                  "完成",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                disabled: password.value.length < 6,
                onTap: () => onPassword(password.value),
              ),
            )
          ],
        ),
      ),
    );
  }
}
