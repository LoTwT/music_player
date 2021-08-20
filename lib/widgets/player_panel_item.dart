import 'package:flutter/material.dart';

class PlayerPanelItem extends StatelessWidget {
  final String iconPath;
  final double width;
  final double height;

  PlayerPanelItem({
    Key? key,
    required this.iconPath,
    this.width = 48,
    this.height = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        iconPath,
        width: width,
        height: height,
      ),
    );
  }
}
