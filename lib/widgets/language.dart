import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          heroTag: "TR",
          mini: false,
          onPressed: () {
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          child: Text(
            'TR',
            style: GoogleFonts.quintessential(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
        const SizedBox(height: 20),
        FloatingActionButton(
          heroTag: "ENG",
          mini: false,
          onPressed: () {
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          child: Text(
            'ENG',
            style: GoogleFonts.quintessential(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
