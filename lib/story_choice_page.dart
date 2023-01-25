import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_app/data.dart';
import 'package:story_app/widgets/setting.dart';

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
  final storyData = StoryData();
  @override
  void initState() {
    currentDialog = widget.dialogNum;
    super.initState();
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
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.grey[900],
        body: FutureBuilder<dynamic>(
          future: storyData.getDialog(widget.chapterNum, currentDialog),
          builder: (context, snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              var dialog = snapshot.data;
              var image = dialog["image"];
              var metin = dialog["text"];
              var choices = dialog["choices"];
              return Container(
                padding: const EdgeInsets.all(10.0),
                //constraints: BoxConstraints.tightForFinite(width: 400),
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
                              Image.asset(
                                image,
                                height: 210,
                                fit: BoxFit.cover,
                              ),
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
                                      currentDialog = dialog["nextdialog"];
                                      return;
                                    }
                                    currentDialog++;
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
                              //textAlign: TextAlign.center,
                              //softWrap: true,
                              //textAlign: TextAlign.center,
                              style: GoogleFonts.quintessential(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline6
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
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                setState(
                                  () {
                                    currentDialog = choice["nextdialog"];
                                    //saveData(choice["text"]);
                                  },
                                );
                              },
                              child: Text(choice["text"]),
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
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
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
        bottomNavigationBar: getSettings(_key),
        endDrawer: const SettingDrawer(),
      ),
    );
  }
}
