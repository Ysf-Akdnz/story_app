import 'package:flutter/material.dart';

class AddChoiceButton extends StatefulWidget {
  const AddChoiceButton(
      {Key? key, required this.onPressed, this.isAddBtn = false})
      : super(key: key);

  final void Function()? onPressed;
  final bool isAddBtn;
  @override
  State<AddChoiceButton> createState() => _AddChoiceButtonState();
}

class _AddChoiceButtonState extends State<AddChoiceButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: widget.onPressed,
          icon: Icon(
            Icons.add_circle_outline_outlined,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
