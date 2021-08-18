import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

typedef OnChangeSquareCategory = void Function(int);

class SquareCategory extends StatelessWidget {
  final int currentId;
  final OnChangeSquareCategory onChanged;
  final List<Map> squareCategoryItems;

  SquareCategory({
    Key? key,
    this.currentId = 0,
    required this.onChanged,
    required this.squareCategoryItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      margin: EdgeInsets.only(top: screen.calc(30)),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: screen.calc(1),
            color: Color(0xffbcbab9),
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.only(
            left: screen.calc(2),
            right: screen.calc(2),
          ),
          child: Row(
            children: squareCategoryItems
                .map(
                  (item) => GestureDetector(
                    onTap: () => onChanged(item["id"] as int),
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: currentId == item["id"]
                            ? screen.calc(23 - 4)
                            : screen.calc(23),
                      ),
                      margin: EdgeInsets.only(
                        left: screen.calc(18),
                        right: screen.calc(18),
                      ),
                      width: screen.calc(83),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: currentId == item["id"]
                            ? Border(
                                bottom: BorderSide(
                                  width: screen.calc(4),
                                  color: Color(0xffff3a3a),
                                ),
                              )
                            : null,
                      ),
                      child: Text(
                        item["title"] as String,
                        style: TextStyle(
                          fontSize: screen.calc(28),
                          fontWeight: FontWeight.w700,
                          color: currentId == item["id"]
                              ? Color(0xffff3a3a)
                              : (item["color"] != null
                                  ? Color(item["color"] as int)
                                  : Color(0xff2b2b2b)),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
