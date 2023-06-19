// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/data/user_story.dart';
import 'dialog_editing.dart';

class DialogCards extends StatefulWidget {
  const DialogCards({super.key});

  @override
  State<DialogCards> createState() => _DialogCardsState();
}

class _DialogCardsState extends State<DialogCards> {
  Future<dynamic> getdialogs() async {
    await Future.delayed(Duration.zero);
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 21, 21, 21),
            Color.fromARGB(221, 68, 68, 68)
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          borderRadius: BorderRadiusDirectional.circular(16.0),
        ),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          children: [
            ...userChapter["dialogs"].map((e) => DailogCardsButtons(
                  id: e["id"],
                  onLongPress: () {
                    setState(() {
                      deleteDialogFromJson(e["id"]);
                    });
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DialogEditing(dialogId: e["id"]),
                      ),
                    );
                  },
                )),
            DailogCardsButtons(
              isAddBtn: true,
              onTap: () {
                setState(() {
                  userChapter["dialogs"].add({
                    "id": userChapter["dialogs"].length,
                    "save": true,
                    "music": "assets/musics/no-sound.ogg",
                    "volume": 0.1,
                    "choices": [
                      {"id": 0, "text": '', "nextdialog": 0}
                    ]
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class DailogCardsButtons extends StatefulWidget {
  const DailogCardsButtons(
      {Key? key,
      this.id,
      this.name,
      this.image,
      this.nextDialog,
      this.save,
      this.onTap,
      this.isAddBtn = false,
      this.onLongPress})
      : super(key: key);

  final int? id;
  final int? nextDialog;
  final bool? save;
  final String? name;
  final String? image;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool isAddBtn;

  @override
  State<DailogCardsButtons> createState() => _DailogCardsButtonsState();
}

class _DailogCardsButtonsState extends State<DailogCardsButtons> {
  bool _isTapped = false;
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
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
      child: Expanded(
        child: Container(
          margin: const EdgeInsets.all(5),
          height: 50,
          width: MediaQuery.of(context).size.width,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.125),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              boxShadow: _isTapped
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 3,
                        offset: const Offset(0, 3),
                      )
                    ]
                  : null),
          child: Align(
              alignment: Alignment.center,
              child: widget.isAddBtn
                  ? Icon(
                      Icons.add_circle_outline,
                      color: Colors.black.withOpacity(0.5),
                      size: 50,
                    )
                  : Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'dialog'.tr + widget.id.toString(),
                      style: GoogleFonts.quintessential(
                          color: Colors.white.withOpacity(0.5), fontSize: 20),
                    )),
        ),
      ),
    );
  }
}
