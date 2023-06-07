import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_app/utils/sound.dart';
import 'package:story_app/utils/speak_function.dart';
import '../sayfalar/stories_menu_page.dart';
import '../sayfalar/user_stories_page.dart';

class GetSettings extends StatefulWidget {
  final GlobalKey<ScaffoldState> sckey;
  final bool menuVisible;
  final bool girisVisible;
  final bool userStories;
  const GetSettings(
      {super.key,
      required this.sckey,
      required this.menuVisible,
      required this.girisVisible,
      required this.userStories});

  @override
  State<GetSettings> createState() => _GetSettingsState();
}

class _GetSettingsState extends State<GetSettings> {
  bool _menuVisible = false;
  bool _girisVisible = false;
  bool _userStories = false;

  @override
  void initState() {
    _menuVisible = widget.menuVisible;
    _girisVisible = widget.girisVisible;
    _userStories = widget.userStories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: _girisVisible,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10, left: 10),
            clipBehavior: Clip.hardEdge,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.black87,
              foregroundColor: Colors.white.withOpacity(0.75),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(
                      color: Colors.white.withOpacity(0.75),
                      width: 1.0,
                      style: BorderStyle.solid)),
              child: const Icon(
                Icons.settings,
                size: 45,
              ),
              onPressed: () {
                widget.sckey.currentState!.openEndDrawer();
              },
            ),
          ),
        ),
        Visibility(
          visible: _menuVisible,
          child: TextButton(
            onPressed: () {
              setState(() {
                playSpeak = !playSpeak;
                if (playSpeak) {
                  TtsController().lastSpeak();
                } else {
                  flutterTts.pause();
                }
              });
            },
            child: Text(
              playSpeak ? 'Duraklat'.tr : 'Oynat'.tr,
              style: GoogleFonts.quintessential(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Visibility(
              visible: _userStories,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StoryListViewUser(),
                    ),
                  );
                },
                child: Container(
                  //width: MediaQuery.of(context).size.width / 1.5,
                  padding: const EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10, right: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(221, 68, 68, 68),
                      Color.fromARGB(255, 21, 21, 21)
                    ], begin: Alignment.topCenter, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(13),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, 6),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Text(
                    'hikayeleriniz'.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quintessential(
                        color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _menuVisible,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const MainMenuPage(),
                    ),
                  );
                },
                child: Text(
                  "MENU",
                  style: GoogleFonts.quintessential(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.75),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
