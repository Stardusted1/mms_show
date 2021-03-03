library animation_lib;

import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mms_show/views/utils.dart';

part 'animation/anim_widgets.dart';

class AnimationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NetworkLottie(),
        PageDivider(),
        AnimatedText(),
        PageDivider(),
        AnimatedWidg(),
        PageDivider()
      ],
    );
  }
}
