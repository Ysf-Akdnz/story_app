import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:story_app/data/data.dart';
import 'package:story_app/utils/audio_background.dart';
import 'package:story_app/utils/speak_function.dart';
import 'package:story_app/widgets/bottom_navigatorbar_button_list.dart';
import 'package:story_app/model/setting.dart';
import 'package:get/get.dart';

// Story nin dialoglarının Gösterildiği yer
class StoryChoicePage extends StatefulWidget {
  final int chapterNum, dialogNum;

  const StoryChoicePage({Key? key, this.chapterNum = 0, this.dialogNum = 0})
      : super(key: key);

  @override
  State<StoryChoicePage> createState() => _StoryChoicePageState();
}

class _StoryChoicePageState extends State<StoryChoicePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  int currentDialog = 0;
  int currentChapter = 0;

  final storyData = StoryData();
  final TtsController _ttsController = TtsController();

  Future<void> _speak(String text) async {
    await _ttsController.speak(text);
    setState(
      () {},
    );
  }

  getStoryValue() {
    currentChapter = widget.chapterNum;
    return currentChapter;
  }

  @override
  void dispose() {
    _ttsController.stop();
    player.stop();
    super.dispose();
  }

  /*@override
  void initState() {
    loadDialogMusic();
    currentDialog = widget.dialogNum;
    super.initState();
  }*/

  @override
  void initState() {
    super.initState();
    currentChapter = widget.chapterNum;
    currentDialog = widget.dialogNum;
    loadDialogMusic();
  }

  @override
  void didUpdateWidget(StoryChoicePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.dialogNum != oldWidget.dialogNum) {
      setCurrentDialog(widget.dialogNum);
    }
  }

  void setCurrentDialog(int dialogNum) {
    if (currentDialog != dialogNum) {
      setState(() {
        currentDialog = dialogNum;
      });
      loadDialogMusic();
    }
  }

  Future<void> loadDialogMusic() async {
    var data = await storyData.getDialog(widget.chapterNum, currentDialog);
    var dialog = data["dialog"];
    var music = dialog["music"];
    var volume = dialog["volume"];
    var playOnce = dialog["playOnce"];
    var loopMode;

    if (music != null) {
      if (playOnce != null && playOnce == true) {
        loopMode = LoopMode.off;
      } else {
        loopMode = LoopMode.all;
      }
      playMusic(music, volume: volume, loopMode: loopMode);
    } else {
      return;
    }
  }

  var currentMetin = "";
  void ondialogloaded(metin) {
    if (metin == currentMetin) return;
    currentMetin = metin;
    _speak(metin);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: GoogleFonts.quintessential(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
    );
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          key: _key,
          backgroundColor: Colors.black87,
          body: FutureBuilder<dynamic>(
            future: storyData.getDialog(widget.chapterNum, currentDialog),
            builder: (context, snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                var dialog = snapshot.data["dialog"];
                var images = snapshot.data["images"];
                var image = StoryData.loadUserStories
                    ? dialog["image"]
                    : images[dialog["image"]];
                var metinID = dialog["text"];
                var choices = dialog["choices"];
                var textData = StoryData.loadUserStories
                    ? {}
                    : snapshot.data["texts"] as Map<String, dynamic>;
                var locale = Get.locale ?? Get.deviceLocale;
                // ignore: prefer_interpolation_to_compose_strings
                var dil = locale!.languageCode + "-" + locale.countryCode!;
                //dil = textData.keys.contains(dil) ? dil : textData.keys.first;

                var metin = StoryData.loadUserStories
                    ? metinID
                    : textData[dil][metinID];
                ondialogloaded(metin);
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (image != null)
                        Center(
                          child: Container(
                            height: 210,
                            margin: const EdgeInsets.only(bottom: 7.5),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadiusDirectional.circular(16.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                StoryData.loadUserStories
                                    ? Image.file(
                                        File(image),
                                        height: 210,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        image,
                                        height: 210,
                                        fit: BoxFit.cover,
                                      )
                              ],
                            ),
                          ),
                        ),
                      Expanded(
                        child: GestureDetector(
                          onTap: choices == null
                              ? () {
                                  setState(
                                    () {
                                      if (currentDialog ==
                                          storyData.numDialog - 1) {
                                        return;
                                      }
                                      if (dialog["nextdialog"] != null) {
                                        setCurrentDialog(dialog["nextdialog"]);
                                        return;
                                      }
                                      setCurrentDialog(currentDialog + 1);
                                    },
                                  );
                                }
                              : null,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.grey[800],
                              borderRadius:
                                  BorderRadiusDirectional.circular(16.0),
                            ),
                            child: SingleChildScrollView(
                              child: Text(
                                metin,
                                style: GoogleFonts.quintessential(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (choices != null)
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: choices.length,
                          itemBuilder: (BuildContext context, int index) {
                            var choice = choices[index];
                            var chText = StoryData.loadUserStories
                                ? choice["text"]
                                : textData[dil][choice["text"]];
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: GestureDetector(
                                  onLongPress: () {
                                    setState(() {
                                      setCurrentDialog(choice["nextdialog"]);
                                    });
                                  },
                                  child: ElevatedButton(
                                    style: style,
                                    onPressed: () {},
                                    child: Text(chText),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
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
          bottomNavigationBar: GetSettings(
            sckey: _key,
            menuVisible: true,
            settingVisible: true,
            userStories: false,
            geriButonu: false,
          ),
          endDrawer: const Settings(),
        ),
      ),
    );
  }
}
