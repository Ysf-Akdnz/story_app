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
    // ignore: deprecated_member_use
    /*db = FirebaseDatabase(
            databaseURL:
                "https://tezprojesi-3ea5d-default-rtdb.europe-west1.firebasedatabase.app")
        .ref();*/
    final snapshot = await db.ref().get();
    //DataSnapshot snapshot = (await db.once()) as DataSnapshot;
    return snapshot.value;
  }

  Future<dynamic> readJson() async {
    prefs = await SharedPreferences.getInstance();
    final dynamic response = await readFirebaseData();
    final jsonString = json.encode(response);
    final Map<String, dynamic> datas = json.decode(jsonString);
    return datas;
  }
  /*prefs = await SharedPreferences.getInstance();
    final String response =
        await rootBundle.loadString('assets/data/story.json');
    return await json.decode(response);*/
  //}

  Future<dynamic> getDialog(int chapterId, int dialogId) async {
    data ??= await readJson(); //data == null ise imiş
    if (data["chapters"].length <= chapterId) {
      return null;
    }
    var chapter = data["chapters"][chapterId];
    numDialog = chapter["dialogs"].length;
    if (chapter["dialogs"].length <= dialogId) {
      return null;
    }
    var dialog = chapter["dialogs"][dialogId];
    bool save = dialog["save"];
    if (save) {
      await prefs.setInt('chapterId', chapterId);
      await prefs.setInt('dialogId', dialogId);
    }
    var dialogView = {"images" : data["images"],"dialog" : dialog};
    return dialogView;
  }
}
