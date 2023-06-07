import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateStoryButton extends StatefulWidget {
  const CreateStoryButton({super.key});

  @override
  State<CreateStoryButton> createState() => _CreateStoryButtonState();
}

class _CreateStoryButtonState extends State<CreateStoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
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
          child: Text(
            'olustur'.tr,
            textAlign: TextAlign.center,
            style: GoogleFonts.quintessential(
                color: Colors.white.withOpacity(0.5), fontSize: 22),
          ),
        ),
      ),
    );
  }
}
