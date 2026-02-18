import 'package:audioplayers/audioplayers.dart';

/// Ses çalma (asset yoksa sessiz). assets/sounds/correct.mp3, wrong.mp3 eklenebilir.
class SoundService {
  SoundService._();

  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playCorrect() async {
    try {
      await _player.play(AssetSource('sounds/correct.mp3'));
    } catch (_) {}
  }

  static Future<void> playWrong() async {
    try {
      await _player.play(AssetSource('sounds/wrong.mp3'));
    } catch (_) {}
  }
}
