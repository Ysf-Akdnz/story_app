import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_app/widgets/temalar/add_choice_btn.dart';
import 'package:story_app/widgets/temalar/choice_btn.dart';
import 'dialog_data.dart';
import '../user_stories.dart';

class CrtStryBtn {
  storyButton(String hintText) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: TextFormField(
        style: GoogleFonts.quintessential(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.quintessential(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

class CrtStryImgView {
  imageView() {
    return const Btn1();
  }
}

class Btn1 extends StatefulWidget {
  const Btn1({super.key});

  @override
  State<Btn1> createState() => _Btn1State();
}

class _Btn1State extends State<Btn1> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: Container(
        margin: const EdgeInsets.only(right: 15, left: 15),
        height: 225,
        width: 150,
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'kf'.tr,
            style: GoogleFonts.quintessential(
              color: Colors.white.withOpacity(0.5),
              fontSize: 20,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.add_circle_outline,
              color: Colors.black.withOpacity(0.5),
              size: 50,
            ),
          ),
        ]),
      ),
    );
  }
}

class DlgNo {
  dlgNo(hintText1, hintText2) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: SizedBox(
            width: double.infinity, // Genişlik sınırlaması
            child: Container(
              margin: const EdgeInsets.only(
                  left: 15, bottom: 25, top: 5, right: 15),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              width: 175,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 6),
                    blurRadius: 5,
                  )
                ],
              ),
              child: Text(
                "Oluştur",
                textAlign: TextAlign.center,
                style: GoogleFonts.quintessential(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          //width: double.infinity, // Genişlik sınırlaması
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(right: 50, left: 0, bottom: 10),
            //padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              style: GoogleFonts.quintessential(color: Colors.white),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText1,
                hintStyle: GoogleFonts.quintessential(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          //width: double.infinity, // Genişlik sınırlaması
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(right: 50, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              style: GoogleFonts.quintessential(color: Colors.white),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText2,
                hintStyle: GoogleFonts.quintessential(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



class DialogsView {
  dialogsView(hintText1) {
    return DialogsViews();
  }
}

class DialogsViews extends StatefulWidget {
  const DialogsViews({
    super.key,
  });

  @override
  State<DialogsViews> createState() => _DialogsViewsState();
}

class _DialogsViewsState extends State<DialogsViews> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: widget.key,
        body: Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadiusDirectional.circular(16.0),
            ),
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
                        hintText: "sadasda",
                        hintStyle: GoogleFonts.quintessential(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    //width: MediaQuery.of(context).size.width,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadiusDirectional.circular(16.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.close,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*class AfBfbutton {
  abButton() {
    return const BeforeAfterButtons();
  }
}

class BeforeAfterButtons extends StatefulWidget {
  const BeforeAfterButtons({super.key});

  @override
  State<BeforeAfterButtons> createState() => _BeforeAfterButtonsState();
}

class _BeforeAfterButtonsState extends State<BeforeAfterButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: InkWell(
            onTap: () {},
            child: Container(
                width: 150,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 21, 21, 21),
                    Color.fromARGB(221, 68, 68, 68)
                  ], begin: Alignment.bottomLeft, end: Alignment.topCenter),
                  borderRadius: BorderRadius.circular(13),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, 6),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Icon(
                  Icons.turn_left,
                  size: 30,
                  color: Colors.white.withOpacity(0.35),
                )
                /*Text(
                "Before",
                textAlign: TextAlign.center,
                style: GoogleFonts.quintessential(
                    color: Colors.white, fontSize: 22),
              ),*/
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 15),
          child: InkWell(
            onTap: () {},
            child: Container(
                width: 150,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(221, 68, 68, 68),
                    Color.fromARGB(255, 21, 21, 21)
                  ], begin: Alignment.topCenter, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(13),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, 6),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Icon(
                  Icons.turn_right,
                  size: 30,
                  color: Colors.white.withOpacity(0.35),
                )
                /*Text(
                "After",
                textAlign: TextAlign.center,
                style: GoogleFonts.quintessential(
                    color: Colors.white, fontSize: 22),
              ),*/
                ),
          ),
        ),
      ],
    );
  }
}*/

/*class DialogList {
  abButton() {
    return;
  }
}

class DialogListt extends StatefulWidget {
  const DialogListt({super.key});

  @override
  State<DialogListt> createState() => _DialogListtState();
}

class _DialogListtState extends State<DialogListt> {
  Future<dynamic> getdialogs() async {
    await Future.delayed(Duration.zero);
    return [];
  }

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
        future: getdialogs(),
        builder: (context, snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            var stories = snapshot.data;
            List<Widget> storyWidget = (stories as List<dynamic>)
                .map((story) => CardButtonsUser(
                      id: story["id"],
                      name: story["name"],
                      imageUrl: story["imageUrl"],
                    ))
                .toList();
            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(10.0),
              childAspectRatio: 9.0 / 13.9,
              children: [
                //...storyWidget,
                const HikEkleButonu(),
              ],
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
    );
  }
}*/
