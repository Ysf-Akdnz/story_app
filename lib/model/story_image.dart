import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryImage extends StatefulWidget {
  const StoryImage({super.key, this.onTap, this.imagePath});
  final void Function()? onTap;
  final String? imagePath;

  @override
  State<StoryImage> createState() => _StoryImageState();
}

class _StoryImageState extends State<StoryImage> {
  bool _isTapped = false;
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
      child: Container(
        margin: const EdgeInsets.only(right: 5, left: 5),
        height: 225,
        //height: 225,
        //width: 150,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 21, 21, 21),
              Color.fromARGB(221, 68, 68, 68)
            ], begin: Alignment.topCenter, end: Alignment.bottomRight),
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
        child: Stack(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //const SizedBox(height: 60),

            Align(
                alignment: Alignment.center,
                child: widget.imagePath == null
                    ? Icon(
                        Icons.add_circle_outline,
                        color: Colors.black.withOpacity(0.5),
                        size: 50,
                      )
                    : Image.file(File(widget.imagePath!))),
            Center(
              child: Text(
                'kf'.tr,
                style: GoogleFonts.quintessential(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
