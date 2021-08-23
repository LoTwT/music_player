import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

class RoundFlatButton extends StatelessWidget {
  final Color fontColor;
  final Color bgColor;
  final String? title;
  final Widget? child;
  final VoidCallback? onTap;
  final bool isOutlined;
  final double width;
  final double height;
  final EdgeInsets? padding;
  final bool disabled;

  RoundFlatButton({
    Key? key,
    this.fontColor = Colors.black,
    this.bgColor = Colors.white,
    this.title,
    this.onTap,
    this.isOutlined = false,
    this.child,
    this.width = 100,
    this.height = 100,
    this.padding,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(child == null || title == null);

    final screen = ScreenUtils(context);
    Widget content;

    if (child == null) {
      content = Text(
        title!,
        style: TextStyle(
          color: fontColor,
          fontWeight: FontWeight.w600,
        ),
      );
    } else
      content = child!;

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(height / 2),
    );

    final button = isOutlined
        ? OutlinedButton(
            onPressed: disabled ? null : onTap,
            child: content,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Colors.white,
                width: screen.calc(2),
              ),
              shape: shape,
              padding: padding,
            ),
          )
        : TextButton(
            onPressed: disabled ? null : onTap,
            child: content,
            style: TextButton.styleFrom(
              shape: shape,
              backgroundColor: bgColor,
              padding: padding,
            ),
          );

    return SizedBox(
      width: width,
      height: height,
      child: Opacity(
        opacity: disabled ? 0.3 : 1,
        child: button,
      ),
    );
  }
}
