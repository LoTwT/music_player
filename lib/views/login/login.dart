import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/views/login/login_auth.dart';
import 'package:music_player/views/login/login_bind.dart';
import 'package:music_player/views/login/login_nickname.dart';
import 'package:music_player/views/login/login_password.dart';
import 'package:music_player/views/login/login_welcome.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments;

    int step = 1;
    if (routeArgs != null) {
      step = (routeArgs as Map)["step"];
    }

    final steps = {
      1: LoginWelcome(
        onLogin: () => Navigator.pushNamed(
          context,
          "/login",
          arguments: {"step": 2},
        ),
        onVisitor: () {},
        onWechat: () {},
        onQQ: () {},
        onWeibo: () {},
        onApple: () {},
        onEasy: () {},
      ),
      2: LoginBind(
        onNext: (area, phone) => Navigator.pushNamed(
          context,
          "/login",
          arguments: {
            "step": 3,
          },
        ),
      ),
      3: LoginAuth(),
    };

    return steps[step]!;
  }
}
