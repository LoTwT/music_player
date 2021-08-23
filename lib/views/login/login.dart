import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/views/login/login_auth.dart';
import 'package:music_player/views/login/login_bind.dart';
import 'package:music_player/views/login/login_nickname.dart';
import 'package:music_player/views/login/login_password.dart';
import 'package:music_player/views/login/login_welcome.dart';

class Login extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final step = useState(1);
    final steps = {
      1: LoginWelcome(
        onLogin: () => step.value++,
        onVisitor: () {},
        onWechat: () {},
        onQQ: () {},
        onWeibo: () {},
        onApple: () {},
        onEasy: () {},
      ),
      2: LoginBind()
    };

    return steps[step.value]!;
  }
}
