import 'package:flutter_tts/flutter_tts.dart';
import 'package:story_app/utils/sound.dart';

final FlutterTts flutterTts = FlutterTts();

class TtsController {
  static String currentText = "";
  Future speak(String text) async {
    currentText = text;
    if (!playSpeak) return;
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(0.75);
    await flutterTts.speak(text);
  }

  Future stop() async {
    await flutterTts.stop();
  }

  Future lastSpeak() async {
    speak(currentText);
  }
}
