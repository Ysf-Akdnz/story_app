import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/arayuz_main.dart';
import 'package:story_app/utils/audio_background.dart';
import 'package:story_app/widgets/setting.dart';

import '../story_choice_page.dart';
import 'get_settings.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  Future<dynamic> exitDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Uygulamadan çıkmak istediğinden emin misin?',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: 'Quintessential'),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () => Navigator.pop(context, false),
                child: const Text(
                  "Nöö",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quintessential'),
                ),
              ),
              const SizedBox(width: 50),
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () {
                  //Navigator.pop(context, true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArayuzMainIskele(),
                    ),
                  );
                },
                child: const Text(
                  "Yesn't",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quintessential'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    playMusic("assets/musics/ezio.mp3", volume: 0.1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            "assets/images/let-me-a-legend.jpeg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Scaffold(
            key: _key,
            backgroundColor: Colors.transparent,
            body: _mainMenuButton(),
            bottomNavigationBar: GetSettings(sckey: _key, menuVisible: false),
            endDrawer: const MySettingDrawer(),
          ),
        ],
      ),
    );
  }

  Widget _mainMenuButton() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              "Tell Me a Legend",
              textAlign: TextAlign.center,
              style: GoogleFonts.quintessential(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
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
        ElevatedButton(
          style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 30),
              backgroundColor: Colors.transparent),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StoryChoicePage(),
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
        ElevatedButton(
          style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 30),
              backgroundColor: Colors.transparent),
          onPressed: () {
            exitDialog();
          },
          child: Text(
            'Çıkış',
            style: GoogleFonts.quintessential(color: Colors.white),
          ), //Çıkış
        ),
        const SizedBox(height: 100)
      ],
    );
  }
}
