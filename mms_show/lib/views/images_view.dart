library images_lib;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:mms_show/views/utils.dart';

part 'images/img_widgets.dart';

class ImagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageCard(
          title: "Image from web",
          url: "https://picsum.photos/200",
        ),
        PageDivider(),
        AssetsImage(
          title: "Image from asset",
          url: 'assets/img/image.jpg',
          isAsset: true,
        ),
        PageDivider(),
        AssetsImage(
          title: "Image from asset, gif",
          url: "assets/img/gif.gif",
          isAsset: true,
        ),
        PageDivider(),
        LocalDriveImage()
      ],
    );
  }
}
