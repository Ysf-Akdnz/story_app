import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';

class StoryData {
  dynamic data;
  int chapterId = 0, numDialog = 0;
  int dialogId = 0;
  late SharedPreferences prefs;
  late DatabaseReference db1;
  late FirebaseDatabase db;

  Future<dynamic> readFirebaseData() async {
    db = FirebaseDatabase.instance;
    db.setPersistenceEnabled(true);
    final snapshot = await db.ref().get();
    return snapshot.value;
  }

  Future<dynamic> readJson() async {
    prefs = await SharedPreferences.getInstance();
    final dynamic response = await readFirebaseData();
    final jsonString = json.encode(response);
    final Map<String, dynamic> datas = json.decode(jsonString);
    return datas;
  }

  Future<dynamic> getDialog(int chapterId, int dialogId) async {
    data ??= await readJson(); //data == null ise imiş
    if (data["chapters"].length <= chapterId) {
      return null;
    }
    var chapter = data["chapters"][chapterId];
    var texts = chapter["texts"];
    numDialog = chapter["dialogs"].length;
    if (chapter["dialogs"].length <= dialogId) {
      return null;
    }
    var dialog = chapter["dialogs"][dialogId];
    var music = dialog["music"];
    var volume = dialog["volume"];
    bool save = dialog["save"];
    if (save) {
      await prefs.setInt('chapterId', chapterId);
      await prefs.setInt('dialogId', dialogId);
    }
    var dialogView = {
      "images": data["images"],
      "dialog": dialog,
      "texts": texts,
      "music": music,
      "volume": volume
    };
    return dialogView;
  }

  Future<dynamic> getStories() async {
    data ??= await readJson();
    if (data["chapters"].length <= chapterId) {
      return null;
    }
    return data["chapters"];
  }

  Future<String> getStoryImage() async {
    data ??= await readJson();
    final prefs = await SharedPreferences.getInstance();
    final chapterId = prefs.getInt('chapterId') ?? 0;
    if (data["chapters"].length <= chapterId) {
      return "assets/images/adsiz.jpg";
    }
    return data["chapters"][chapterId]["imageUrl"];
  }

  Future<String> getStoryMusic() async {
    data ??= await readJson();
    final prefs = await SharedPreferences.getInstance();
    final chapterId = prefs.getInt('chapterId') ?? 0;
    if (data["chapters"].length <= chapterId) {
      return "assets/musics/main-menu-music.ogg";
    }
    return data["chapters"][chapterId]["music"];
  }

  Future<String> getStoryName() async {
    data ??= await readJson();
    final prefs = await SharedPreferences.getInstance();
    final chapterId = prefs.getInt('chapterId') ?? 0;
    if (data["chapters"].length <= chapterId) {
      return " ";
    }
    return data["chapters"][chapterId]["name"];
  }
}
