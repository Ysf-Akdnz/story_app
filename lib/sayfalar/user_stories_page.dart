import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/data/data.dart';
import 'package:story_app/data/user_story.dart';
import 'package:story_app/sayfalar/stories_menu_page.dart';
import 'package:story_app/model/setting.dart';
import 'package:story_app/sayfalar/user_create_story_page.dart';
import '../widgets/bottom_navigatorbar_button_list.dart';

class StoryListViewUser extends StatefulWidget {
  const StoryListViewUser({super.key});

  @override
  State<StoryListViewUser> createState() => _StoryListViewUserState();
}

class CardButtonsUser extends StatefulWidget {
  const CardButtonsUser(
      {Key? key,
      required this.id,
      required this.name,
      this.imageUrl,
      this.onLongPress})
      : super(key: key);

  final int id;
  final String name;
  final String? imageUrl;
  final void Function()? onLongPress;

  @override
  State<CardButtonsUser> createState() => _CardButtonsUserState();
}

class _CardButtonsUserState extends State<CardButtonsUser> {
  bool _isTapped = false;
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.onLongPress,
      onTap: () async {
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
              image:
                  getImage() /* if(widget.imageUrl == null)
               AssetImage("story_app/assets/images/adsiz.jpg") else
              FileImage(File(widget.imageUrl)) */
              ,
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

  dynamic getImage() => widget.imageUrl == null
      ? const AssetImage("assets/images/adsiz.jpg")
      : FileImage(File(widget.imageUrl!));
}

class _StoryListViewUserState extends State<StoryListViewUser> {
  final storyData = StoryData();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final GlobalKey _dialogKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          key: _key,
          backgroundColor: Colors.black87,
          bottomNavigationBar: GetSettings(
            sckey: _key,
            menuVisible: false,
            settingVisible: true,
            userStories: false,
            geriButonu: true,
          ),
          endDrawer: const Settings(),
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
              future: storyData.getStories(userStories: true),
              key: _dialogKey,
              builder: (context, snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  return StatefulBuilder(builder: (context, setInnerState) {
                    var stories = snapshot.data;
                    return GridView.count(
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(10.0),
                      childAspectRatio: 9.0 / 13.9,
                      children: [
                        ...(stories as List<dynamic>)
                            .map(
                              (story) => CardButtonsUser(
                                id: story["id"],
                                name: story["name"],
                                imageUrl: story["imageUrl"],
                                onLongPress: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          backgroundColor: Colors.black54,
                                          title: Text(
                                            story["name"],
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.quintessential(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                            ),
                                          ),
                                          content: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                onPressed: () async {
                                                  userChapter = (await storyData
                                                          .getStories(
                                                              userStories:
                                                                  true))[
                                                      story["id"]];
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const StoryOlusturma(),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  'düzenle'.tr,
                                                  style: GoogleFonts
                                                      .quintessential(
                                                    color: Colors.blue
                                                        .withOpacity(0.8),
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  await deleteStoryFromJson(
                                                      story["id"]);
                                                  // ignore: unused_local_variable
                                                  var data = await storyData
                                                      .getStories(
                                                          userStories: true,
                                                          reload: true);
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const StoryListViewUser(),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  'sil'.tr,
                                                  style: GoogleFonts
                                                      .quintessential(
                                                    color: Colors.red
                                                        .withOpacity(0.8),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ));
                                    },
                                  );
                                },
                              ),
                            )
                            .toList(),
                        const HikEkleButonu(),
                      ],
                    );
                  });
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
      onTap: () {
        userChapter = {
          "id": -1,
          "name": "",
          "imageUrl": null,
          "music": null,
          "translated": false,
          "dialogs": [
            /* {
      "id": 0,
      "image": "",
      "save": true,
      "text": 0,
      "music": "assets/musics/skyrim.mp3",
      "volume": 0.9
    } */
          ],
        };
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
