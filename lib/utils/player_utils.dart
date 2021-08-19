import 'package:audioplayers/audioplayers.dart';

AudioPlayer? _audioPlayer;

/// 单例模式
AudioPlayer usePlayer() {
  if (_audioPlayer == null) {
    _audioPlayer = AudioPlayer();
  }

  return _audioPlayer!;
}
