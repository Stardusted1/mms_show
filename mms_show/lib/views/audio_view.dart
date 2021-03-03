library audio_lib;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

import 'utils.dart';

part 'audio/audio_widgets.dart';

class AudioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WebUrlPlayer(),
        PageDivider(),
        LocalFilePlayer(),
        PageDivider()
      ],
    );
  }
}