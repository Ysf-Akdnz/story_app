import 'package:just_audio/just_audio.dart';
import 'package:story_app/utils/sound.dart';

final player = AudioPlayer();
var currentMusic = "";
var lastVolume = 1.0;

void playMusic(path, {double volume = 1.0, loopMode = LoopMode.off}) async {
  if (player.playing && currentMusic == path) return;
  lastVolume = volume;
  if (muteMusic) volume = 0;
  currentMusic = path;
  await player.setVolume(volume);
  await player.stop();
  await Future.delayed(const Duration(seconds: 2));
  await player.setAsset(currentMusic);
  await player.setLoopMode(loopMode);
  await player.play();
}

void setMute() async {
  await player.setVolume(0);
}

void setLastVolume() async {
  await player.setVolume(lastVolume);
}
