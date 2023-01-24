import 'package:flutter/material.dart';
import 'package:story_app/widgets/language.dart';
import 'package:story_app/widgets/volume_button.dart';

class SettingDrawer extends StatelessWidget {
  const SettingDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: 90,
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Languages(),
          Container(
            margin: const EdgeInsets.only(bottom: 7.5),
            child: VolumeButton(),
          ),
        ],
      ),
    );
  }
}

Widget getSettings(GlobalKey<ScaffoldState> _key) {
  return Row(
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10, left: 10),
        clipBehavior: Clip.hardEdge,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: const Icon(
            Icons.miscellaneous_services,
            size: 45,
          ),
          onPressed: () {
            _key.currentState!.openEndDrawer();
          },
        ),
      ),
    ],
  );
}
