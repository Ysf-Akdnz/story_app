import 'package:flutter/material.dart';
import 'package:story_app/butonlar/language_buttons.dart';
import 'package:story_app/butonlar/volume_button.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: 90,
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Languages(),
          Container(
            margin: const EdgeInsets.only(bottom: 7.5),
            child: const VolumeButton(),
          ),
        ],
      ),
    );
  }
}
