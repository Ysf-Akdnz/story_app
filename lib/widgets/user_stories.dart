import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/data.dart';
import 'package:story_app/widgets/main_menu.dart';
import 'package:story_app/widgets/setting.dart';
import 'package:story_app/widgets/story_olusturma.dart';

import 'get_settings.dart';

class CardListViewUser extends StatefulWidget {
  const CardListViewUser({super.key});

  @override
  State<CardListViewUser> createState() => _CardListViewUserState();
}

class CardButtonsUser extends StatefulWidget {
  const CardButtonsUser(
      {Key? key, required this.id, required this.name, required this.imageUrl})
      : super(key: key);

  final int id;
  final String name;
  final String imageUrl;

  @override
  State<CardButtonsUser> createState() => _CardButtonsUserState();
}

class _CardButtonsUserState extends State<CardButtonsUser> {
  bool _isTapped = false;
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('chapterId', widget.id);
        await prefs.setInt('dialogId', 0);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainMenuPage(),
          ),
        );
      },
      onTapDown: ((details) {
        setState(() {
          _isTapped = true;
        });
      }),
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(widget.imageUrl),
              fit: BoxFit.fill,
            ),
            boxShadow: _isTapped
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: const Offset(0, 3),
                    )
                  ]
                : null),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 200),
            child: Center(
              child: Text(
                widget.name,
                style: GoogleFonts.quintessential(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CardListViewUserState extends State<CardListViewUser> {
  final storyData = StoryData();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.black87,
        bottomNavigationBar: GetSettings(
          sckey: _key,
          menuVisible: false,
          girisVisible: true,
        ),
        endDrawer: const MySettingDrawer(),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.grey[900],
            borderRadius: BorderRadiusDirectional.circular(16.0),
          ),
          child: FutureBuilder<dynamic>(
            future: storyData.getStories(),
            builder: (context, snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                var stories = snapshot.data;
                List<Widget> storyWidget = (stories as List<dynamic>)
                    .map((story) => CardButtonsUser(
                          id: story["id"],
                          name: story["name"],
                          imageUrl: story["imageUrl"],
                        ))
                    .toList();
                return GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(10.0),
                  childAspectRatio: 9.0 / 13.9,
                  children: [
                    ...storyWidget,
                    const HikEkleButonu(),
                  ],
                );
              } else if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ];
              } else {
                children = <Widget>[
                  const SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Loading',
                      style: GoogleFonts.quintessential(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ];
              }
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HikEkleButonu extends StatefulWidget {
  const HikEkleButonu({super.key});

  @override
  State<HikEkleButonu> createState() => _HikEkleButonuState();
}

class _HikEkleButonuState extends State<HikEkleButonu> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const StoryOlusturma(),
          ),
        );
      },
      onTapDown: ((details) {
        setState(() {
          _isTapped = true;
        });
      }),
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: _isTapped
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: const Offset(0, 3),
                    )
                  ]
                : null),
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.add_circle_outline,
            color: Colors.black.withOpacity(0.5),
            size: 50,
          ),
        ),
      ),
    );
  }
}
