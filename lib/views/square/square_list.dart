import 'package:flutter/material.dart';
import 'package:music_player/utils/screen_utils.dart';

class SquareList extends StatelessWidget {
  final List<Map> songInfoList;

  SquareList({
    Key? key,
    required this.songInfoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);
    final rows = <List>[];

    for (var i = 0; i < songInfoList.length; i += 3) {
      rows.add(songInfoList.sublist(i, i + 3));
    }

    return Container(
      padding: EdgeInsets.only(
        left: screen.calc(32),
        right: screen.calc(32),
      ),
      child: Column(
        children: rows
            .map(
              (row) => Container(
                margin: EdgeInsets.only(top: screen.calc(36)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: row
                      .map(
                        (item) => _SquareListItem(songInfo: item),
                      )
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _SquareListItem extends StatelessWidget {
  final songInfo;

  _SquareListItem({
    Key? key,
    required this.songInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtils(context);

    return Container(
      width: screen.calc(214),
      height: screen.calc(300),
      child: GestureDetector(
        onTap: () => print(songInfo["id"]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(screen.calc(12)),
              child: Image.asset(
                songInfo["img"],
                width: screen.calc(214),
                height: screen.calc(214),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screen.calc(8)),
              child: Text(
                songInfo["title"],
                maxLines: 2,
                style: TextStyle(fontSize: screen.calc(24)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
