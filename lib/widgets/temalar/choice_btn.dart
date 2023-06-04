import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_app/widgets/temalar/dialog_data.dart';

class ChoiceButton extends StatefulWidget {
  const ChoiceButton({super.key, required this.id, this.onPressed});

  final int id;
  final void Function()? onPressed;
  @override
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
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
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadiusDirectional.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: widget.onPressed,
              icon: Icon(Icons.close),
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
                            "Kaydet",
                            style: GoogleFonts.quintessential(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        )
                      ],
                      backgroundColor: Colors.black54,
                      title: Text(
                        "Seçim Yazısı",
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
                            hintText: "Yaz",
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
