library video_lib;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:mms_show/views/utils.dart';
import 'package:video_player/video_player.dart';

part 'video/vid_widgets.dart';

class VideoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoWidget(),
        PageDivider(),
        VideoWidgetAsset(),
        PageDivider(),
        VideoWidgetLocal(),
        PageDivider(),
      ],
    );
  }
}
