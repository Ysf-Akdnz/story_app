import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryData {
  dynamic data;
  int chapterId = 0;
  int dialoId = 0;
  late SharedPreferences prefs;

  Future<dynamic> readJson() async {
    prefs = await SharedPreferences.getInstance();
    final String response =
        await rootBundle.loadString('assets/data/story.json');
    return await json.decode(response);
  }

  Future<dynamic> getDialog(int chapterId, int dialogId) async {
    data ??= await readJson(); //data == null ise imiş
    var chapter = data["chapters"][chapterId];
    var dialog = chapter["dialogs"][dialogId];
    bool save = dialog["save"];
    if (save) {
      await prefs.setInt('chapterId', chapterId);
      await prefs.setInt('dialogId', dialogId);
    }
    return dialog;
  }
}
