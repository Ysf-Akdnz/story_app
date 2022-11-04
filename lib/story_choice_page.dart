import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_app/data.dart';
import 'package:story_app/widgets/volume_button.dart';

class StoryChoicePage extends StatefulWidget {
  final int chapterNum, dialogNum;

  const StoryChoicePage({Key? key, this.chapterNum = 0, this.dialogNum = 0})
      : super(key: key);

  @override
  State<StoryChoicePage> createState() => _StoryChoicePageState();
}

class _StoryChoicePageState extends State<StoryChoicePage> {
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
        backgroundColor: Colors.grey[900],
        body: FutureBuilder<dynamic>(
          future: StoryData().readJson(),
          builder: (context, snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              var data = snapshot.data;
              var chapter = snapshot.data["chapters"][widget.chapterNum];
              var dialog = chapter["dialogs"][widget.dialogNum];
              var metin = dialog["text"];
              var choices = dialog["choices"];
              print(choices);
              return Container(
                padding: const EdgeInsets.all(10.0),
                //constraints: BoxConstraints.tightForFinite(width: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 7.5),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadiusDirectional.circular(16.0),
                      ),
                      child: Image.asset('assets/images/foto.jpeg'),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[800],
                          borderRadius: BorderRadiusDirectional.circular(16.0),
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            metin,
                            textAlign: TextAlign.center,
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
                    if (choices != null)
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: choices.length,
                        itemBuilder: (BuildContext context, int index) {
                          var choice = choices[index]["text"];
                          print(choice);
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: style,
                              onPressed: () {},
                              child: Text(choice),
                            ),
                          );
                        },
                      ),
                    /*Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: style,
                              onPressed: () {},
                              child: Text('Seçim 1'),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: style,
                              onPressed: () {},
                              child: Text('Seçim 2'),
                            ),
                          ),
                        ],
                      ),*/
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          heroTag: "Menu",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          backgroundColor: Colors.grey[900],
                          child: const Icon(
                            Icons.menu,
                            size: 45,
                          ),
                        ),
                        const VolumeButton(),
                      ],
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
      ),
    );
  }
}
