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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hikaye İsmi',
      theme: ThemeData(
          //primarySwatch: Colors.grey,
          ),
      home: StoryApp(title: 'Hikaye İsmi'),
    );
  }
}

class StoryApp extends StatefulWidget {
  StoryApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  MainMenu createState() => MainMenu();
}

class MainMenu extends State<StoryApp> {
  bool _isShowDial = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _MainMenuButton(),
        floatingActionButton: _getFloatingActionButton(),
      ),
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
        FloatingActionButton(
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
        FloatingActionButton(
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
        FloatingActionButton(
          mini: false,
          onPressed: () {
            //if no need to change the menu status
            // _isShowDial = !_isShowDial;
            //Icon(Icons.volume_off);
          },
          backgroundColor: Colors.grey[900],
          child: const Icon(
            Icons.volume_up_outlined,
            size: 40,
          ),
        ),
      ],
      isSpeedDialFABsMini: true,
      paddingBtwSpeedDialButton: 30.0,
    );
  }

  // ignore: non_constant_identifier_names
  Widget _MainMenuButton() {
    return Container(
      color: Colors.grey[900],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
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
              onPressed: () {},
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
                    builder: (context) => const StoryPage(),
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

class StoryPage extends StatelessWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: StoryPageChild(),
      ),
    );
  }
}

class StoryPageChild extends StatelessWidget {
  const StoryPageChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 1),
          Container(
            //margin: EdgeInsets.fromLTRB(18, 0, 18, 0),
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadiusDirectional.circular(16.0),
              color: Colors.grey,
            ),
            child: Center(
              child: Image.asset('assets/images/foto.jpeg'),
            ),
          ),
          Container(
            height: 480,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[800],
              borderRadius: BorderRadiusDirectional.circular(16.0),
            ),
            child: Center(
              child: Text(
                'Metin',
                style: GoogleFonts.quintessential(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(
                color: Colors.white,
              ),
              /*FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.grey[900],
                child: Icon(
                  Icons.menu,
                  size: 45,
                ),
              ),*/
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.grey[900],
                child: Icon(
                  Icons.volume_up_outlined,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 1)
        ],
      ),
    );
  }
}
