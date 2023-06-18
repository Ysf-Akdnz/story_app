import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/data/data.dart';
import 'package:story_app/utils/audio_background.dart';
import 'package:story_app/model/setting.dart';
import '../butonlar/exit_buttons.dart';
import 'story_choice_page.dart';
import '../widgets/bottom_navigatorbar_button_list.dart';

// Story Yeni Devam tuşlarının olduğu yer
class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final storyData = StoryData();
  bool showExitStory = true;
  bool showExitUserStory = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Stack(
          children: [
            FutureBuilder<dynamic>(
                future: storyData.getStoryImage(),
                builder: (context, snapshot) {
                  String imageUrl = snapshot.hasData
                      ? snapshot.data
                      : "assets/images/adsiz.jpg";
                  return StoryData.loadUserStories && snapshot.hasData
                      ? Image.file(
                          File(imageUrl),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          imageUrl,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        );
                }),
            Scaffold(
              key: _key,
              backgroundColor: Colors.transparent,
              body: _mainMenuButton(),
              bottomNavigationBar: GetSettings(
                sckey: _key,
                menuVisible: false,
                settingVisible: true,
                userStories: false,
                geriButonu: false,
              ),
              endDrawer: const Settings(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainMenuButton() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Center(
            child: FutureBuilder<dynamic>(
                future: storyData.getStoryName(),
                builder: (context, snapshot) {
                  String name = snapshot.hasData ? snapshot.data : " ";
                  return Text(
                    name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quintessential(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  );
                }),
          ),
        ),
        ElevatedButton(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 30),
                backgroundColor: Colors.transparent),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final chapterId = prefs.getInt('chapterId') ?? 0;
              final dialogId = prefs.getInt('dialogId') ?? 0;
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => StoryChoicePage(
                    chapterNum: chapterId,
                    dialogNum: dialogId,
                  ),
                ),
              );
            },
            child: Text(
              'Devam Et'.tr,
              style: GoogleFonts.quintessential(color: Colors.white),
            )), //Devam Et
        const SizedBox(height: 25),
        ElevatedButton(
          style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 30),
              backgroundColor: Colors.transparent),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            final chapterId = prefs.getInt('chapterId') ?? 0;
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StoryChoicePage(
                  chapterNum: chapterId,
                  dialogNum: 0,
                ),
              ),
            );
          },
          child: Text(
            'Yeni Oyun'.tr,
            style: GoogleFonts.quintessential(color: Colors.white),
          ), //Yeni Oyun
        ),
        const SizedBox(height: 25),
        if (showExitStory)
          ExitButtons(
            exitStory: true,
            exitUserStory: false,
          ),
        if (showExitUserStory)
          ExitButtons(
            exitStory: false,
            exitUserStory: true,
          ),
        const SizedBox(height: 100)
      ],
    );
  }
}
