import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/widgets/setting.dart';

import '../story_choice_page.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.grey[900],
        body: _mainMenuButton(),
        bottomNavigationBar: getSettings(_key),
        endDrawer: const SettingDrawer(),
      ),
    );
  }

  Widget _mainMenuButton() {
    return Container(
      color: Colors.grey[900],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                  "Rose'un Harikalar Diyarı",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quintessential(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 30)),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final chapterId = prefs.getInt('chapterId') ?? 0;
                final dialogId = prefs.getInt('dialogId') ?? 0;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StoryChoicePage(
                      chapterNum: chapterId,
                      dialogNum: dialogId,
                    ),
                  ),
                );
              },
              child: Text(
                'Devam Et',
                style: GoogleFonts.quintessential(color: Colors.white),
              )), //Devam Et
          const SizedBox(height: 25),
          TextButton(
            style:
                TextButton.styleFrom(textStyle: const TextStyle(fontSize: 30)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryChoicePage(),
                ),
              );
            },
            child: Text(
              'Yeni Oyun',
              style: GoogleFonts.quintessential(color: Colors.white),
            ), //Yeni Oyun
          ),
          /*const SizedBox(height: 25),
          TextButton(
            style:
                TextButton.styleFrom(textStyle: const TextStyle(fontSize: 30)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoadPage(),
                ),
              );
            },
            child: Text(
              'Load',
              style: GoogleFonts.quintessential(color: Colors.white),
            ), //Yeni Oyun
          ),*/
          const SizedBox(height: 25),
          TextButton(
            style:
                TextButton.styleFrom(textStyle: const TextStyle(fontSize: 30)),
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text(
              'Çıkış',
              style: GoogleFonts.quintessential(color: Colors.white),
            ), //Çıkış
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
