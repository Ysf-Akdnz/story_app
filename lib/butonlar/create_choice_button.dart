import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateChoiceButton extends StatefulWidget {
  const CreateChoiceButton({super.key, required this.id, this.onPressed});

  final int id;
  final void Function()? onPressed;
  @override
  State<CreateChoiceButton> createState() => _CreateChoiceButtonState();
}

class _CreateChoiceButtonState extends State<CreateChoiceButton> {
  String yazi = "";
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
              yazi,
              style: GoogleFonts.quintessential(
                  color: Colors.white.withOpacity(0.5)),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    TextEditingController controller = TextEditingController();
                    return AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(
                              () {
                                yazi = controller.text;
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
                      content: Form(
                        child: TextFormField(
                          controller: controller,
                          style:
                              GoogleFonts.quintessential(color: Colors.white),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "...",
                            hintStyle: GoogleFonts.quintessential(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
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
