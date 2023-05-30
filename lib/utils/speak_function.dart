import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:story_app/utils/sound.dart';

final FlutterTts flutterTts = FlutterTts();

class TtsController {
  static String currentText = "";
  double speechRate = 0.5;
  Future speak(String text) async {
    currentText = text;
    if (!playSpeak) return;
    await flutterTts.setLanguage('dil'.tr);
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(getSpeechRateValue());
    await flutterTts.setVolume(0.75);
    await flutterTts.speak(text);
  }

  Future stop() async {
    await flutterTts.stop();
  }

  Future lastSpeak() async {
    speak(currentText);
  }

  double getSpeechRateValue() {
    double speechRateValue = double.parse('speechRate'.tr);
    speechRate = speechRateValue;
    return speechRate;
  }
}
