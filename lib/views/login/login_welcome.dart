import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';
import 'package:music_player/widgets/round_flat_button.dart';

/// 登录欢迎页
class LoginWelcome extends StatelessWidget {
  final VoidCallback? onLogin;
  final VoidCallback? onVisitor;
  final VoidCallback? onWechat;
  final VoidCallback? onQQ;
  final VoidCallback? onWeibo;
  final VoidCallback? onApple;
  final VoidCallback? onEasy;

  LoginWelcome({
    Key? key,
    this.onLogin,
    this.onVisitor,
    this.onWechat,
    this.onQQ,
    this.onWeibo,
    this.onApple,
    this.onEasy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Scaffold(
      body: Container(
        width: screen.screenWidth,
        height: screen.screenHeight,
        color: Color(0xffc93e2d),
        child: Stack(
          children: [
            Container(
              width: screen.screenWidth,
              child: Column(
                children: [
                  Container(
                    width: screen.calc(148),
                    height: screen.calc(148),
                    margin: EdgeInsets.only(
                      top: screen.calc(312),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffde4033),
                      borderRadius: BorderRadius.circular(74),
                      image: DecorationImage(
                        image: AssetImage("assets/icon-login-logo.png"),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screen.calc(202)),
                    child: Column(
                      children: [
                        RoundFlatButton(
                          child: Text(
                            "手机号登录",
                            style: TextStyle(
                              color: Color(0xffea4d44),
                              fontSize: screen.calc(32),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: onLogin,
                          width: screen.calc(556),
                          height: screen.calc(92),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screen.calc(36)),
                        ),
                        RoundFlatButton(
                          child: Text(
                            "立即体验",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screen.calc(32),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          isOutlined: true,
                          onTap: onVisitor,
                          width: screen.calc(556),
                          height: screen.calc(92),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screen.calc(77)),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor:
                                        Colors.white.withOpacity(.4),
                                  ),
                                  child: Checkbox(
                                    value: false,
                                    onChanged: (val) => true,
                                  )),
                              Text(
                                "同意",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.4),
                                ),
                              ),
                              Text(
                                "《服务条款》",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                ),
                              ),
                              Text(
                                "《隐私政策》",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                ),
                              ),
                              Text(
                                "《儿童隐私政策》",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: screen.calc(72),
              width: screen.screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: screen.calc(10),
                      right: screen.calc(10),
                    ),
                    child: RoundFlatButton(
                      child: Image.asset("assets/icon-wechat.png"),
                      bgColor: Colors.white,
                      onTap: onWechat,
                      width: screen.calc(72),
                      height: screen.calc(72),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screen.calc(10),
                      right: screen.calc(10),
                    ),
                    child: RoundFlatButton(
                      child: Image.asset("assets/icon-qq.png"),
                      bgColor: Colors.white,
                      onTap: onQQ,
                      width: screen.calc(72),
                      height: screen.calc(72),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screen.calc(10),
                      right: screen.calc(10),
                    ),
                    child: RoundFlatButton(
                      child: Image.asset("assets/icon-weibo.png"),
                      bgColor: Colors.white,
                      onTap: onWeibo,
                      width: screen.calc(72),
                      height: screen.calc(72),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screen.calc(10),
                      right: screen.calc(10),
                    ),
                    child: RoundFlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icon-apple.png",
                            width: screen.calc(32),
                            height: screen.calc(32),
                          ),
                          Text(
                            "通过 Apple 登录",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      bgColor: Colors.white,
                      onTap: onApple,
                      width: screen.calc(280),
                      height: screen.calc(68),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screen.calc(10),
                      right: screen.calc(10),
                    ),
                    child: RoundFlatButton(
                      child: Image.asset("assets/icon-easy.png"),
                      bgColor: Colors.white,
                      onTap: onEasy,
                      width: screen.calc(72),
                      height: screen.calc(72),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
