import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/views/login/login_header.dart';

typedef AuthCallback = void Function(String);

/// 登录验证码页
class LoginAuth extends StatelessWidget {
  final AuthCallback onFinish;

  LoginAuth({
    Key? key,
    required this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: screen.screenPaddingTop,
          left: screen.calc(32),
          right: screen.calc(32),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginHeader(title: "手机号验证"),
              Container(
                child: Column(
                  children: [
                    // 验证码已发送
                    Container(
                      margin: EdgeInsets.only(top: screen.calc(116)),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "验证码已发送至",
                        style: TextStyle(
                          fontSize: screen.calc(34),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // 号码 + 倒计时
                    _AuthCode(),
                    // 输入验证码
                    _Inputs(
                      onFinish: onFinish,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthCode extends HookWidget {
  Timer? timer;
  final totalTime = 60;

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final time = useState(totalTime);
    bool isTimeout;

    if (timer != null) timer?.cancel();
    if (time.value <= 0) {
      isTimeout = true;
    } else {
      isTimeout = false;
      timer = Timer(Duration(seconds: 1), () => time.value--);
    }
    return Container(
      margin: EdgeInsets.only(top: screen.calc(30)),
      height: screen.calc(80),
      child: Row(
        children: [
          Text(
            "+86 180****1126",
            style: TextStyle(
              color: Color(0xffa7a7a7),
              fontSize: screen.calc(26),
            ),
          ),
          Spacer(),
          isTimeout
              ? TextButton(
                  child: Text("重新发送"),
                  onPressed: () {
                    print("重新发送");
                    time.value = totalTime;
                  },
                )
              : Text(
                  "${time.value}s",
                  style: TextStyle(
                    color: Color(0xffa7a7a7),
                    fontSize: screen.calc(26),
                  ),
                ),
        ],
      ),
    );
  }
}

class _Inputs extends HookWidget {
  final AuthCallback onFinish;

  _Inputs({
    Key? key,
    required this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final inputValues = useState(["", "", "", ""]);
    List<Widget> inputs = [];

    for (var i = 0; i < 4; i++) {
      inputs.add(
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: screen.calc(4),
                  color: inputValues.value[i] == ""
                      ? Color(0xffb2b2b2)
                      : Color(0xff2e2e2e),
                ),
              ),
            ),
            child: TextField(
              autofocus: i == 0,
              onChanged: (val) {
                List<String> tempValues = [];
                tempValues.addAll(inputValues.value);
                tempValues[i] = val;

                if (i == 3) {
                  FocusScope.of(context).unfocus();
                  // 只要第 4 位输入，就会触发 onFinish，需判断和加按钮
                  onFinish(tempValues.join(""));
                } else {
                  FocusScope.of(context).nextFocus();
                }

                inputValues.value = tempValues;
              },
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screen.calc(36),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      );

      inputs.add(
        Container(
          width: screen.calc(35),
        ),
      );
    }

    inputs.removeAt(inputs.length - 1);
    return Container(
      margin: EdgeInsets.only(top: screen.calc(128)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: inputs,
      ),
    );
  }
}
