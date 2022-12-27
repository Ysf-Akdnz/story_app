import 'package:flutter/material.dart';

class VolumeButton extends StatefulWidget {
  const VolumeButton({super.key});

  @override
  State<VolumeButton> createState() => _VolumeButtonState();
}

class _VolumeButtonState extends State<VolumeButton> {
  bool _isVolumeMute = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "Ses aç/kapa",
      mini: false,
      onPressed: () {
        setState(() {
          _isVolumeMute = !_isVolumeMute;
        });
      },
      backgroundColor: Colors.transparent,
      child: Icon(
        _isVolumeMute ? Icons.volume_off : Icons.volume_up_outlined,
        size: 40,
      ),
    );
  }
}
