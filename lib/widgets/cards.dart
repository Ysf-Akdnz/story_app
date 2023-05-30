import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/data.dart';
import 'package:story_app/model/stories_repository.dart';
import 'package:story_app/model/story.dart';
import 'package:story_app/story_choice_page.dart';
import 'package:story_app/widgets/main_menu.dart';

class CardListView extends StatefulWidget {
  const CardListView({super.key});

  @override
  State<CardListView> createState() => _CardListViewState();
}

class CardButtons extends StatefulWidget {
  const CardButtons(
      {Key? key, required this.id, required this.name, required this.imageUrl})
      : super(key: key);

  final int id;
  final String name;
  final String imageUrl;

  @override
  State<CardButtons> createState() => _CardButtonsState();
}

class _CardButtonsState extends State<CardButtons> {
  bool _isTapped = false;
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('chapterId', widget.id);
        await prefs.setInt('dialogId', 0);
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

class _CardListViewState extends State<CardListView> {
  final storyData = StoryData();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                .map((story) => CardButtons(
                      id: story["id"],
                      name: story["name"],
                      imageUrl: story["imageUrl"],
                    ))
                .toList();
            return GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(10.0),
                childAspectRatio: 9.0 / 13.9,
                children: [...storyWidget, ]);
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
    );
  }
}
