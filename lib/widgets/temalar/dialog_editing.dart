import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_choice_btn.dart';
import 'choice_btn.dart';
import 'dialog_data.dart';

class DialogEditing extends StatefulWidget {
  const DialogEditing({super.key});

  @override
  State<DialogEditing> createState() => _DialogEditingState();
}

class _DialogEditingState extends State<DialogEditing> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadiusDirectional.circular(16.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {},
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
                        //margin: const EdgeInsets.only(right: ),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
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
                          child: Icon(
                            Icons.add_circle_outline,
                            color: Colors.black.withOpacity(0.5),
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    //width: MediaQuery.of(context).size.width,
                    height: 200,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadiusDirectional.circular(16.0),
                    ),
                    child: TextFormField(
                      style: GoogleFonts.quintessential(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Hikayeni yaz.",
                        hintStyle: GoogleFonts.quintessential(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  childAspectRatio: 5,
                  children: [
                    ...choiceList.map(
                      (e) => ChoiceButton(
                        id: e["id"],
                        onPressed: () {
                          setState(
                            () {
                              choiceList.remove(
                                choiceList.firstWhere(
                                    (element) => element["id"] == e["id"]),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    AddChoiceButton(
                      onPressed: () {
                        setState(
                          () {
                            if (choiceList.length < 5)
                              choiceList.add({"id": choiceList.length});
                          },
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
