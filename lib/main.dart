import 'package:flutter/material.dart';
import 'package:story_app/widgets/mainMenu.dart';

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
  HikUygState createState() => HikUygState();
}

class HikUygState extends State<HikUyg> {
  Future<bool?> showWarning(BuildContext context) async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Uygulamadan çıkmak istediğinden emin misin?',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Quintessential'),
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
                  onPressed: () => Navigator.pop(context, true),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WillPopScope(
        onWillPop: () async {
          final shouldpop = await showWarning(context);
          return shouldpop ?? false;
        },
        child: MainMenuPage(),
      ),
    );
  }
}
