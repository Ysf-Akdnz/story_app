import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_app/utils/sound.dart';
import 'package:story_app/utils/speak_function.dart';
import 'main_menu.dart';

class GetSettings extends StatefulWidget {
  final GlobalKey<ScaffoldState> sckey;
  final bool menuVisible;
  final bool girisVisible;
  const GetSettings(
      {super.key,
      required this.sckey,
      required this.menuVisible,
      required this.girisVisible});

  @override
  State<GetSettings> createState() => _GetSettingsState();
}

class _GetSettingsState extends State<GetSettings> {
  bool _menuVisible = false;
  bool _girisVisible = false;

  @override
  void initState() {
    _menuVisible = widget.menuVisible;
    _girisVisible = widget.girisVisible;
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
        )
      ],
    );
  }
}
