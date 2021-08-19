import 'package:flutter/material.dart';

const songs = [
  {
    "id": "1",
    "img": "assets/tmp_cover_1.jpg",
    "count": "9亿",
    "title": "[华语新歌] 最新华语音乐专辑"
  },
  {
    "id": "2",
    "img": "assets/tmp_cover_2.jpg",
    "count": "19亿",
    "title": "今天从《Titan》听起 | 私人雷达"
  },
  {
    "id": "3",
    "img": "assets/tmp_cover_3.jpg",
    "count": "39亿",
    "title": "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  },
  {"id": "4", "img": "assets/tmp_cover_4.jpg", "count": "434", "title": "bbb"},
  {"id": "5", "img": "assets/tmp_cover_5.jpg", "count": "59亿", "title": "ccc"},
  {"id": "6", "img": "assets/tmp_cover_6.jpg", "count": "2342", "title": "ddd"}
];

const recommend_songs = [
  {
    "id": "1",
    "img": "assets/tmp_cover_1.jpg",
    "title": "Tempest",
    "artist": "Capo Productions",
    "tip": "你到不了的地方 音乐能带你到"
  },
  {
    "id": "2",
    "img": "assets/tmp_cover_2.jpg",
    "title": "aaa",
    "artist": "bbb",
    "tip": "sadfasdf"
  },
  {
    "id": "3",
    "img": "assets/tmp_cover_3.jpg",
    "title": "asdf",
    "artist": "gfhjgf",
    "tip": "fghjgfhjgfhjfghj"
  },
  {
    "id": "4",
    "img": "assets/tmp_cover_4.jpg",
    "title": "dfvccbnvc",
    "artist": "rthfghdfg",
    "tip": "shsghsgfh"
  },
  {
    "id": "5",
    "img": "assets/tmp_cover_5.jpg",
    "title": "5",
    "artist": "5",
    "tip": "5"
  },
  {
    "id": "6",
    "img": "assets/tmp_cover_6.jpg",
    "title": "6",
    "artist": "6",
    "tip": "6"
  },
];

const categoryList = [
  {"title": "每日推荐", "img": "assets/cate_1.png"},
  {"title": "歌单", "img": "assets/cate_4.png"},
  {"title": "排行榜", "img": "assets/cate_6.png"},
  {"title": "直播", "img": "assets/cate_11.png"},
  {"title": "电台", "img": "assets/cate_22.png"},
  {"title": "火前", "img": "assets/cate_32.png"},
  {"title": "其它", "img": "assets/cate_33.png"},
];

const BottomNavbarInfos = <Map>[
  {
    "imgPath": "assets/icon-music-acc-b.png",
    "activeImgPath": "assets/icon-music-acc.png",
    "title": "发现",
  },
  {
    "imgPath": "assets/icon-video-b.png",
    "activeImgPath": "assets/icon-video.png",
    "title": "视频",
  },
  {
    "imgPath": "assets/icon-music-b.png",
    "activeImgPath": "assets/icon-music.png",
    "title": "我的",
  },
  {
    "imgPath": "assets/icon-group-b.png",
    "activeImgPath": "assets/icon-group.png",
    "title": "云村",
  },
  {
    "imgPath": "assets/icon-person-b.png",
    "activeImgPath": "assets/icon-person.png",
    "title": "帐号",
  },
];

const SquareCategoryItems = [
  {"id": 0, "title": "推荐", "color": null},
  {"id": 1, "title": "官方", "color": null},
  {"id": 2, "title": "精品", "color": 0xffe7aa5a},
  {"id": 3, "title": "欧美", "color": null},
  {"id": 4, "title": "电子", "color": null},
  {"id": 5, "title": "流行", "color": null},
  {"id": 6, "title": "乡村", "color": null},
  {"id": 7, "title": "其它", "color": null},
  {"id": 8, "title": "aa", "color": null},
  {"id": 9, "title": "bb", "color": null},
  {"id": 10, "title": "cc", "color": null},
  {"id": 11, "title": "dd", "color": null},
];

var squareBannerItems = [
  {
    "index": 0,
    "title": "请保持眉梢欢跃，因为有人等你对视",
    "img": "assets/tmp_square_cover_1.png"
  },
  {"index": 1, "title": "111", "img": "assets/tmp_square_cover_2.png"},
  {"index": 2, "title": "222", "img": "assets/tmp_square_cover_3.png"},
  {"index": 3, "title": "333", "img": "assets/tmp_square_cover_1.png"},
  {"index": 4, "title": "444", "img": "assets/tmp_square_cover_2.png"},
  {"index": 5, "title": "555", "img": "assets/tmp_square_cover_3.png"},
  {"index": 6, "title": "666", "img": "assets/tmp_square_cover_1.png"},
];

const SquareListItems = [
  {"id": 11, "img": "assets/tmp_cover_1.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 12, "img": "assets/tmp_cover_2.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 13, "img": "assets/tmp_cover_3.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 14, "img": "assets/tmp_cover_4.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 15, "img": "assets/tmp_cover_5.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 16, "img": "assets/tmp_cover_6.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 17, "img": "assets/tmp_cover_1.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 18, "img": "assets/tmp_cover_2.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 19, "img": "assets/tmp_cover_3.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 20, "img": "assets/tmp_cover_4.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 21, "img": "assets/tmp_cover_5.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 22, "img": "assets/tmp_cover_6.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 23, "img": "assets/tmp_cover_1.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 24, "img": "assets/tmp_cover_2.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 25, "img": "assets/tmp_cover_3.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 26, "img": "assets/tmp_cover_4.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 27, "img": "assets/tmp_cover_5.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
  {"id": 28, "img": "assets/tmp_cover_6.jpg", "title": "钢琴摇滚 | 浪子赠予诗人的一纸情书"},
];

const PlayerInteractiveIcons = [
  "assets/icon-heart-w.png",
  "assets/icon-download-w.png",
  "assets/icon-bell-w.png",
  "assets/icon-message-w.png",
  "assets/icon-3dot-w.png",
];
