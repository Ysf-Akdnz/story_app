import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/data.dart';
import 'package:story_app/widgets/main_menu.dart';
import 'package:story_app/widgets/setting.dart';
import 'package:story_app/widgets/temalar/crt_stry.dart';
import 'dialog_data.dart';
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
        //height: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey[900],
          borderRadius: BorderRadiusDirectional.circular(16.0),
        ),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          children: [
            ...dialogList.map((e) => DailogCardsButtons(
                  id: e["id"],
                  name: "name",
                  image: "image",
                  nextDialog: 1,
                  save: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DialogEditing(),
                      ),
                    );
                  },
                )),
            DailogCardsButtons(
              id: 1,
              name: "asdsa",
              image: "adasd",
              nextDialog: 0,
              save: false,
              isAddBtn: true,
              onTap: () {
                setState(() {
                  dialogList.add({"id": dialogList.length});
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
      required this.id,
      required this.name,
      required this.image,
      required this.nextDialog,
      required this.save,
      required this.onTap,
      this.isAddBtn = false})
      : super(key: key);

  final int id;
  final int nextDialog;
  final bool save;
  final String name;
  final String image;
  final void Function()? onTap;
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
          margin: EdgeInsets.all(5),
          height: 50,
          width: MediaQuery.of(context).size.width,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
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
                      "Diyalog " + widget.id.toString(),
                      style: GoogleFonts.quintessential(
                          color: Colors.white.withOpacity(0.8), fontSize: 20),
                    )),
        ),
      ),
    );
  }
}
