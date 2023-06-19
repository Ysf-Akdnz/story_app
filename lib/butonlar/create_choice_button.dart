import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/user_story.dart';

class CreateChoiceButton extends StatefulWidget {
  const CreateChoiceButton(
      {super.key, required this.id, this.onPressed, required this.dialogId});

  final int dialogId;
  final int id;
  final void Function()? onPressed;
  @override
  State<CreateChoiceButton> createState() => _CreateChoiceButtonState();
}

class _CreateChoiceButtonState extends State<CreateChoiceButton> {
  String yazi = "";

  List<DropdownMenuItem> get items => getDialogs()
      .map((value) => DropdownMenuItem(
            value: value["id"],
            child: Text(
              'dialog'.tr + "${value["id"]}",
              style: const TextStyle(color: Colors.white),
            ),
          ))
      .toList();

  List<dynamic> getDialogs() => userChapter["dialogs"] as List<dynamic>;
  getDialog() => getDialogs()[widget.dialogId];
  getChoice() => getDialog()["choices"][widget.id];
  GlobalKey dropdownKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 100,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadiusDirectional.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(Icons.close),
              color: Colors.white.withOpacity(0.5),
            ),
            Text(
              getChoice()["text"],
              style: GoogleFonts.quintessential(
                  color: Colors.white.withOpacity(0.5)),
            ),
            Text(
              "${getChoice()["nextdialog"]}",
              style: GoogleFonts.quintessential(
                  color: Colors.white.withOpacity(0.5)),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    TextEditingController controller =
                        TextEditingController(text: getChoice()["text"]);
                    //TextEditingController controller2 = TextEditingController();
                    int nextDialog = getChoice()["nextdialog"] ?? 0;

                    return AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(
                              () {
                                getChoice()["text"] = controller.text;
                                getChoice()["nextdialog"] = nextDialog;
                                Navigator.pop(context);
                              },
                            );
                          },
                          child: Text(
                            'save'.tr,
                            style: GoogleFonts.quintessential(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        )
                      ],
                      backgroundColor: Colors.black54,
                      title: Text(
                        'choiceText'.tr,
                        style: GoogleFonts.quintessential(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      content: StatefulBuilder(
                          builder: (context, setInnerState) => Form(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: controller,
                                      //initialValue: getChoice()["text"],
                                      style: GoogleFonts.quintessential(
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Seçenek Yazısı",
                                        hintStyle: GoogleFonts.quintessential(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    DropdownButton(
                                      key: dropdownKey,
                                      items: items,
                                      value: nextDialog,
                                      hint: const Text(
                                        "Gidilecek Diyalog",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      dropdownColor: Colors.grey,
                                      focusColor: Colors.white,
                                      onChanged: (value) {
                                        setInnerState(() {
                                          setState(() {
                                            nextDialog = value;
                                          });
                                          //dropdownKey.currentState?.build(context);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )),
                    );
                  },
                );
              },
              icon: Icon(
                Icons.edit,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
