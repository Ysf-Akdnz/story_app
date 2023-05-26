import 'package:flutter/material.dart';
import 'package:story_app/widgets/language.dart';
import 'package:story_app/widgets/volume_button.dart';

class MySettingDrawer extends StatefulWidget {
  const MySettingDrawer({super.key});

  @override
  State<MySettingDrawer> createState() => _MySettingDrawerState();
}

class _MySettingDrawerState extends State<MySettingDrawer> {
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
