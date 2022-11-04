import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'story_choice_page.dart';

void main() => runApp(StoryApp());

class StoryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Hikaye Uygulaması',
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: HikUyg(),
    );
  }
}

class HikUyg extends StatefulWidget {
  HikUyg({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  MainMenu createState() => MainMenu();
}

class MainMenu extends State<HikUyg> {
  //bool _isShowDial = false;
  //bool _isVolumeMute = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _mainMenuButton(),
        //floatingActionButton: _getFloatingActionButton(),
      ),
    );
  }

  /*Widget _getFloatingActionButton() {
    return SpeedDialMenuButton(
      //if needed to close the menu after clicking sub-FAB
      isShowSpeedDial: _isShowDial,
      //manually open or close menu
      updateSpeedDialStatus: (isShow) {
        //return any open or close change within the widget
        _isShowDial = isShow;
      },
      //general init
      isMainFABMini: false,
      mainMenuFloatingActionButton: MainMenuFloatingActionButton(
          backgroundColor: Colors.grey[900],
          mini: false,
          child: const Icon(Icons.menu, size: 40),
          onPressed: () {},
          closeMenuChild: const Icon(
            Icons.close,
            size: 40,
          ),
          closeMenuForegroundColor: Colors.white,
          closeMenuBackgroundColor: Colors.grey[900]),
      floatingActionButtonWidgetChildren: <FloatingActionButton>[
        FloatingActionButton(heroTag: "ENG",
          mini: false,
          onPressed: () {
            //if need to close menu after click
            //_isShowDial = false;
            setState(() {});
          },
          backgroundColor: Colors.grey[900],
          child: Text(
            'ENG',
            style: GoogleFonts.quintessential(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        FloatingActionButton(heroTag: "TR",
          mini: false,
          onPressed: () {
            //if need to toggle menu after click
            //_isShowDial = _isShowDial;
            setState(() {});
          },
          backgroundColor: Colors.grey[900],
          child: Text(
            'TR',
            style: GoogleFonts.quintessential(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
        FloatingActionButton(heroTag: "Ses aç/kapa 1",
          mini: false,
          onPressed: () {
            setState(() {
              _isVolumeMute =! _isVolumeMute;
            });
          },
          backgroundColor: Colors.grey[900],
          child: Icon(
            _isVolumeMute?Icons.volume_off:Icons.volume_up_outlined,
            size: 40,
          ),
        ),
      ],
      isSpeedDialFABsMini: true,
      paddingBtwSpeedDialButton: 30.0,
    );
  }*/

  Widget _mainMenuButton() {
    return Container(
      color: Colors.grey[900],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 200,
            margin: const EdgeInsets.all(100),
            child: Text(
              'Hikaye İsmi',
              textAlign: TextAlign.center,
              style: GoogleFonts.quintessential(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 25),
          TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 30)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryChoicePage(
                      chapterNum: 0,
                      dialogNum: 1,
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
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 30)),
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
              )), //Yeni Oyun
          const SizedBox(height: 25),
          TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 30)),
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text(
                'Çıkış',
                style: GoogleFonts.quintessential(color: Colors.white),
              )), //Çıkış
        ],
      ),
    );
  }
}
