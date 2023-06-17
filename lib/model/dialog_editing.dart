import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_app/model/story_image.dart';
import '../butonlar/add_choice_btn.dart';
import '../butonlar/create_choice_button.dart';
import '../data/user_story.dart';

class DialogEditing extends StatefulWidget {
  const DialogEditing({super.key, required this.dialogId});
  final int dialogId;

  @override
  State<DialogEditing> createState() => _DialogEditingState();
}

class _DialogEditingState extends State<DialogEditing> {
  String? imagePath;
  String test = "";
  Future<void> uploadImage() async {
    final String? uploadedImagePath = await saveImageToAppStorage();
    if (uploadedImagePath == null) {
      return;
    }
    setState(() {
      getDialog()["image"] = uploadedImagePath;
    });
  }

  getDialog() => userChapter["dialogs"][widget.dialogId];
  List<dynamic> getChoices() => getDialog()["choices"] as List<dynamic>;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 21, 21, 21),
              Color.fromARGB(221, 68, 68, 68)
            ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
            borderRadius: BorderRadiusDirectional.circular(16.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image Selection
                StoryImage(
                  onTap: uploadImage,
                  imagePath: getDialog()["image"],
                ),
                dialogText(context),
                choices(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  GridView choices() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 1,
      childAspectRatio: 5,
      children: [
        ...getChoices().map(
          (e) => CreateChoiceButton(
            id: e["id"],
            dialogId: widget.dialogId,
            onPressed: () {
              setState(
                () {
                  getChoices().remove(
                    getChoices()
                        .firstWhere((element) => element["id"] == e["id"]),
                  );
                  for (var i = 0; i < getChoices().length; i++) {
                    getChoices()[i]["id"] = i;
                  }
                },
              );
            },
          ),
        ),
        AddChoiceButton(
          onPressed: () {
            setState(
              () {
                if (getChoices().length < 2) {
                  getChoices().add({
                    "id": getChoices().length,
                    "text": "",
                    "nextdialog": 0
                  } as dynamic);
                }
              },
            );
          },
        )
      ],
    );
  }

  SizedBox dialogText(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        //height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadiusDirectional.circular(16.0),
        ),
        child: TextFormField(
          minLines: 2,
          maxLines: 10,
          keyboardType: TextInputType.multiline,
          style: GoogleFonts.quintessential(color: Colors.white),
          textAlign: TextAlign.start,
          initialValue: getDialog()["text"],
          onChanged: (value) {
            setState(() {
              getDialog()["text"] = value;
            });
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'ws'.tr,
            hintStyle: GoogleFonts.quintessential(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
