import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import './data.dart';

final ImagePicker picker = ImagePicker();

Map<String, dynamic> userChapter = {
  "id": -1,
  "name": "",
  "imageUrl": null,
  "music": "assets/musics/no-sound.ogg",
  "translated": false,
  "playOnce": true,
  "volume": 0.1,
  "dialogs": [
    /* {
      "id": 0,
      "image": "",
      "save": true,
      "text": 0,
      "music": "assets/musics/skyrim.mp3",
      "volume": 0.9
    } */
  ],
};
int currentEditId = 0;

Future<String?> saveImageToAppStorage() async {
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image == null) {
    return null;
  }
  final String cacheImagePath = image.path;
  final Directory appDirectory = await getApplicationDocumentsDirectory();
  final String directoryPath = '${appDirectory.path}/images';
  final Directory directory = Directory(directoryPath);

  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }
  final String fileName = cacheImagePath.split('/').last;
  final String newPath = '$directoryPath/$fileName';
  final File imageFile = File(cacheImagePath);
  final File newFile = await imageFile.copy(newPath);
  return newFile.path;
}

Future<int> saveStoryToJson() async {
  final data = await StoryData.readUserStories() ?? {};
  var userStories = (data["chapters"] as List<dynamic>?) ?? {};
  var id = userChapter["id"];
  if (id == -1) {
    id = userStories.length;
    getChapters(data).add(userChapter);
    data["chapters"][id]["id"] = id;
    currentEditId = id;
  } else {
    data["chapters"][id] = userChapter;
  }
  await saveJsonToFile(data, "user_story");
  return id;
}

Future<void> deleteStoryFromJson(int id) async {
  final data = await StoryData.readUserStories() ?? {};
  getChapters(data).remove(getChapters(data)[id]);
  for (var i = 0; i < getChapters(data).length; i++) {
    getChapters(data)[i]["id"] = i;
  }
  await saveJsonToFile(data, "user_story");
}

void deleteDialogFromJson(int id) {
  (userChapter["dialogs"] as List<dynamic>).remove(userChapter["dialogs"][id]);
  for (var i = 0; i < userChapter["dialogs"].length; i++) {
    userChapter["dialogs"][i]["id"] = i;
    var choices = userChapter["dialogs"][i]["choices"] as List<dynamic>;
    for (var j = 0; j < choices.length; j++) {
      if (userChapter["dialogs"][i]["choices"][j]["nextdialog"] >=
          (userChapter["dialogs"] as List<dynamic>).length) {
        userChapter["dialogs"][i]["choices"][j]["nextdialog"] =
            (userChapter["dialogs"] as List<dynamic>).length - 1;
      }
    }
  }
}

List<dynamic> getChapters(Map<String, dynamic> data) =>
    data["chapters"] as List<dynamic>;

Future<void> saveJsonToFile(
    Map<String, dynamic> jsonMap, String fileName) async {
  final Directory appDirectory = await getApplicationDocumentsDirectory();
  final String filePath = '${appDirectory.path}/$fileName.json';

  final File file = File(filePath);
  await file.writeAsString(jsonEncode(jsonMap));
}
