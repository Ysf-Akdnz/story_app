import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_app/model/stories_repository.dart';
import 'package:story_app/model/story.dart';

class CardListView extends StatefulWidget {
  const CardListView({super.key});

  @override
  State<CardListView> createState() => _CardListViewState();
}

class CardButtons extends StatefulWidget {
  const CardButtons(
      {Key? key,
      required this.id,
      required this.name,
      required this.imageUrl,
      required this.page})
      : super(key: key);

  final int id;
  final String name;
  final String imageUrl;
  final Widget page;

  @override
  State<CardButtons> createState() => _CardButtonsState();
}

class _CardButtonsState extends State<CardButtons> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoriesRepository.stories[widget.id].page,
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

List<CardButtons> _buildGridCards() {
  List<Story> stories = StoriesRepository.loadStories();
  List<CardButtons> cards = stories
      .map((story) => CardButtons(
            id: story.id,
            name: story.name,
            imageUrl: story.imageUrl,
            page: story.page,
          ))
      .toList();
  return cards;
}

class _CardListViewState extends State<CardListView> {
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
      child: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10.0),
        childAspectRatio: 9.0 / 13.9,
        children: _buildGridCards(),
      ),
    );
  }
}
