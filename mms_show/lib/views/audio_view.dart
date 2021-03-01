library audio_lib;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

part 'audio/widgets.dart';

enum PlayerState { paused, playing, seeking, stopped }

class AudioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            WebUrlPlayer(),
            Divider(
              endIndent: 10,
              indent: 10,
              color: Colors.black,
            ),
            LocalFilePlayer()
          ],
        ),
      ],
    );
  }
}
