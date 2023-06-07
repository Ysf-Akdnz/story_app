import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryName {
  storyName(String hintText) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 21, 21, 21),
          Color.fromARGB(221, 68, 68, 68)
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(15),
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
