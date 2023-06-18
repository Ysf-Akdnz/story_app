import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';

class StoryData {
  dynamic data;
  int chapterId = 0, numDialog = 0;
  int dialogId = 0;
  late SharedPreferences prefs;
  late DatabaseReference db1;
  late FirebaseDatabase db;
  static bool loadUserStories = false;

  static Future<Map<String, dynamic>?> readJsonFromFile(String fileName) async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String filePath = '${appDirectory.path}/$fileName.json';

    final File file = File(filePath);

    if (await file.exists()) {
      final String fileContent = await file.readAsString();
      final Map<String, dynamic> jsonMap = jsonDecode(fileContent);
      return jsonMap;
    } else {
      return null;
    }
  }

  Future<dynamic> readFirebaseData() async {
    db = FirebaseDatabase.instance;
    db.setPersistenceEnabled(true);
    final snapshot = await db.ref().get();
    return snapshot.value;
  }

  static Future<Map<String, dynamic>?> readUserStories() async {
    return (await readJsonFromFile("user_story")) ?? {"chapters": []};
  }

  Future<dynamic> readJson() async {
    prefs = await SharedPreferences.getInstance();
    final dynamic response =
        loadUserStories ? await readUserStories() : await readFirebaseData();
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
    var playOnce = dialog["playOnce"];
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
      "volume": volume,
      "playOnce": playOnce
    };
    return dialogView;
  }

  Future<dynamic> getStories(
      {bool userStories = false, bool reload = false}) async {
    if (loadUserStories != userStories || data == null || reload) {
      loadUserStories = userStories;
      data = await readJson();
    }

    /*  if (data["chapters"].length <= chapterId) {
      return null;
    } */
    return data["chapters"] ?? [];
  }

  Future<String?> getStoryImage() async {
    data ??= await readJson();
    final prefs = await SharedPreferences.getInstance();
    final chapterId = prefs.getInt('chapterId') ?? 0;
    if (data["chapters"].length <= chapterId) {
      return "assets/images/adsiz.jpg";
    }
    return data["chapters"][chapterId]["imageUrl"];
  }

  /*Future<String?> getStoryMusic() async {
    data ??= await readJson();
    final prefs = await SharedPreferences.getInstance();
    final chapterId = prefs.getInt('chapterId') ?? 0;
    if (data["chapters"].length <= chapterId) {
      return "assets/musics/main-menu-music.ogg";
    }
    final chapter = data["chapters"][chapterId];
    return chapter["music"];
  }*/

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
