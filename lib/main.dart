/*import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
void main() {
  runApp(
    HikayeUygulamasi(),
  );
}

class HikayeUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MainMenuWidgets(),
      ),
    );
  }
}*/
/*
class MainMenuWidgets extends StatelessWidget {
  // const MyButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(100),
            child: const Text(
              'Hikaye İsmi',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 25),
          TextButton(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30)),
              onPressed: () {},
              child: const Text(
                'Devam Et',
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(height: 25),
          TextButton(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30)),
              onPressed: () {},
              child: const Text(
                'Yeni Oyun',
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(height: 25),
          TextButton(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30)),
              onPressed: () {},
              child: const Text(
                'Çıkış',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hikaye İsmi',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: StoryApp(title: 'Hikaye İsmi'),
    );
  }
}

class StoryApp extends StatefulWidget {
  StoryApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MainMenu createState() => _MainMenu();
}

class _MainMenu extends State<StoryApp> {
  bool _isShowDial = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MainMenuButton(),
      floatingActionButton: _getFloatingActionButton(),
    );
  }

  Widget _getFloatingActionButton() {
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
          mini: false,
          child: const Icon(Icons.menu),
          onPressed: () {},
          closeMenuChild: Icon(Icons.close),
          closeMenuForegroundColor: Colors.black,
          closeMenuBackgroundColor: Colors.white),
      floatingActionButtonWidgetChildren: <FloatingActionButton>[
        FloatingActionButton(
          mini: false,
          onPressed: () {
            //if need to close menu after click
            //_isShowDial = false;
            setState(() {});
          },
          backgroundColor: Colors.blue[700],
          child: const Text(
            'ENG',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        FloatingActionButton(
          mini: false,
          onPressed: () {
            //if need to toggle menu after click
            //_isShowDial = _isShowDial;
            setState(() {});
          },
          backgroundColor: Colors.red[700],
          child: const Text(
            'TR',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        FloatingActionButton(
          mini: false,
          child: Icon(Icons.volume_up),
          onPressed: () {
            //if no need to change the menu status
            // _isShowDial = !_isShowDial;
            //Icon(Icons.volume_off);
          },
          backgroundColor: Colors.white,
        ),
      ],
      isSpeedDialFABsMini: true,
      paddingBtwSpeedDialButton: 30.0,
    );
  }

  Widget _MainMenuButton() {
    return Container(
      color: Colors.grey[900],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 200,
            margin: EdgeInsets.all(100),
            child: const Text(
              'Hikaye İsmi',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 25),
          TextButton(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30)),
              onPressed: () {},
              child: const Text(
                'Devam Et',
                style: TextStyle(color: Colors.white),
              )), //Devam Et
          SizedBox(height: 25),
          TextButton(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30)),
              onPressed: () {},
              child: const Text(
                'Yeni Oyun',
                style: TextStyle(color: Colors.white),
              )), //Yeni Oyun
          SizedBox(height: 25),
          TextButton(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30)),
              onPressed: () {},
              child: const Text(
                'Çıkış',
                style: TextStyle(color: Colors.white),
              )), //Çıkış
        ],
      ),
    );
  }
}
