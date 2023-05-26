import 'package:flutter/material.dart';
import 'package:story_app/utils/audio_background.dart';
import '../utils/sound.dart';

class VolumeButton extends StatefulWidget {
  const VolumeButton({super.key});

  @override
  State<VolumeButton> createState() => _VolumeButtonState();
}

class _VolumeButtonState extends State<VolumeButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      heroTag: "Ses aç/kapa",
      mini: false,
      onPressed: () {
        setState(() {
          muteMusic = !muteMusic;
          if (muteMusic) {
            setMute();
          } else {
            setLastVolume();
          }
        });
      },
      backgroundColor: Colors.transparent,
      child: Icon(
        muteMusic ? Icons.volume_off : Icons.volume_up_outlined,
        color: Colors.yellow.shade700,
        size: 40,
      ),
    );
  }
}
