import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_app/model/story_name.dart';
import 'package:story_app/model/dialogCards.dart';
import 'package:story_app/sayfalar/user_stories_page.dart';

import '../butonlar/create_story_button.dart';
import '../data/data.dart';
import '../data/user_story.dart';
import '../model/story_image.dart';

class StoryOlusturma extends StatefulWidget {
  const StoryOlusturma({super.key});

  @override
  State<StoryOlusturma> createState() => _StoryOlusturmaState();
}

class _StoryOlusturmaState extends State<StoryOlusturma> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: const Scaffold(
          backgroundColor: Colors.black87,
          body: CreateStory(),
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }
}

class CreateStory extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CreateStory({Key? key});

  @override
  State<CreateStory> createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  TextEditingController textEditingController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  final storyData = StoryData();
  String? imagePath;
  int? id;

  Future<void> uploadImage() async {
    final String? uploadedImagePath = await saveImageToAppStorage();
    if (uploadedImagePath == null) {
      return;
    }
    setState(() {
      userChapter["imageUrl"] = uploadedImagePath;
    });
  }

  bool areDialogTextsValid() {
    final dialogs = userChapter['dialogs'] as List<dynamic>;
    final coverImage = userChapter["imageUrl"];
    if (dialogs.length == 0 || coverImage == null) return false;
    for (final dialog in dialogs) {
      final dialogText = dialog['text'];
      if (dialogText == null || dialogText.isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  String test = "";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          CreateStoryButton(onTap: () async {
            if (areDialogTextsValid()) {
              test = jsonEncode(userChapter as dynamic);
              await saveStoryToJson();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const StoryListViewUser(),
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.black54,
                    title: Text(
                      'uyari'.tr,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quintessential(
                        color: Colors.red.withOpacity(0.8),
                      ),
                    ),
                    content: Text(
                      'uyariMetni'.tr,
                      style: GoogleFonts.quintessential(
                          color: Colors.white.withOpacity(0.8)),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'tmm'.tr,
                          style: GoogleFonts.quintessential(
                            color: Colors.blue.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }),
          StoryName(
            hintText: 'storyName'.tr,
            //textController: textEditingController,
            initialValue: userChapter["name"],
            onChanged: (p0) {
              userChapter["name"] = p0;
            },
          ),
          StoryImage(
            onTap: uploadImage,
            imagePath: userChapter["imageUrl"],
          ),
          const SizedBox(height: 10),
          const DialogCards()
        ],
      ),
    );
  }
}
