import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/views/login/login_header.dart';
import 'package:music_player/widgets/round_flat_button.dart';

/// 登录绑定(手机号)页
class LoginBind extends StatelessWidget {
  final onNext;

  LoginBind({
    Key? key,
    required this.onNext,
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
              LoginHeader(title: "绑定手机号"),
              Padding(
                padding: EdgeInsets.only(top: screen.calc(72)),
                child: Center(
                  child: Image.asset(
                    "assets/login_img_1.png",
                    width: screen.calc(344),
                    height: screen.calc(311),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screen.calc(10)),
                child: Text(
                  "绑定手机号，让你的帐号更安全",
                  style: TextStyle(
                    color: Color(0xff999999),
                    fontSize: screen.calc(26),
                  ),
                ),
              ),
              _Content(onNext: onNext),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends HookWidget {
  final onNext;

  _Content({
    Key? key,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    final items = ["+86", "+1", "+2", "+3"];
    final currentArea = useState(items[0]);
    final isValid = useState(false);

    final controller = useState(TextEditingController());
    controller.value.addListener(() {
      const pattern = r"^1\d{10}$";
      isValid.value = RegExp(pattern).hasMatch(controller.value.value.text);
    });

    return Container(
      margin: EdgeInsets.only(top: screen.calc(72)),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                DropdownButton(
                  value: currentArea.value,
                  style: TextStyle(
                    fontSize: screen.calc(32),
                    color: Color(0xff333333),
                  ),
                  items: items
                      .map(
                        (item) => DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        ),
                      )
                      .toList(),
                  onChanged: (val) => currentArea.value = val as String,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: screen.calc(30),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.phone,
                    controller: controller.value,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screen.calc(61)),
            child: RoundFlatButton(
              child: Text(
                "下一步",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screen.calc(32),
                ),
              ),
              width: screen.calc(686),
              height: screen.calc(80),
              bgColor: Color(0xffea4331),
              onTap: () => onNext(
                currentArea.value,
                controller.value.value.text,
              ),
              disabled: !isValid.value,
            ),
          ),
        ],
      ),
    );
  }
}
