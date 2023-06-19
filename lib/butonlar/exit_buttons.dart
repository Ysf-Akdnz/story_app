import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../sayfalar/user_stories_page.dart';
import '../widgets/story_list_widget.dart';
import '../sayfalar/main_menu_page.dart';

class ExitButtons extends StatefulWidget {
  //final bool exitUserStory;
  //final bool exitStory;
  const ExitButtons({
    super.key,
    /*required this.exitUserStory, required this.exitStory*/
  });

  @override
  State<ExitButtons> createState() => _ExitButtonsState();
}

class _ExitButtonsState extends State<ExitButtons> {
  Future<dynamic> exitStory() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Exit'.tr,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: 'Quintessential'),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'Nöö'.tr,
                  style: const TextStyle(
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GirisSayfasi(),
                    ),
                  );
                },
                child: Text(
                  'Yesnt'.tr,
                  style: const TextStyle(
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

  /*Future<dynamic> exitUserStory() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Exit'.tr,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: 'Quintessential'),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'Nöö'.tr,
                  style: const TextStyle(
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StoryListViewUser(),
                    ),
                  );
                },
                child: Text(
                  'Yesnt'.tr,
                  style: const TextStyle(
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
  }*/

  //bool _exitUserStory = true;
  //bool _exitStory = true;

  /*@override
  void initState() {
    _exitUserStory = widget.exitUserStory;
    _exitStory = widget.exitStory;
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*Visibility(
          visible: _exitUserStory,
          child: ElevatedButton(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 30),
                backgroundColor: Colors.transparent),
            onPressed: () {
              exitUserStory();
            },
            child: Text(
              'Çıkış'.tr,
              style: GoogleFonts.quintessential(color: Colors.white),
            ), //Çıkış
          ),
        ),*/
        Visibility(
          //visible: _exitStory,
          child: ElevatedButton(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 30),
                backgroundColor: Colors.transparent),
            onPressed: () {
              exitStory();
            },
            child: Text(
              'Çıkış'.tr,
              style: GoogleFonts.quintessential(color: Colors.white),
            ), //Çıkış
          ),
        ),
      ],
    );
  }
}
