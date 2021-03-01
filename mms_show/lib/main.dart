import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mms_show/page_bloc.dart';

import 'views/animation_view.dart';
import 'views/audio_view.dart';
import 'views/images_view.dart';
import 'views/video_view.dart';

void main() {
  runApp(BlocProvider(create: (context) => PageBlock(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
          primaryColor: Colors.black, scaffoldBackgroundColor: Colors.white),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final widgets = <int, Widget>{
      0: Text("Images"),
      1: Text("Animation"),
      2: Text("Video"),
      3: Text("Audio"),
    };
    return BlocBuilder(
        cubit: context.read<PageBlock>(),
        builder: (context, state) => CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                transitionBetweenRoutes: true,
                backgroundColor: Colors.transparent,
                middle: CupertinoSlidingSegmentedControl(
                  children: widgets,
                  onValueChanged: (value) => selectView(context, value),
                  groupValue: context.read<PageBlock>().state,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(child: _getCurrentWidget(state)),
              ),
            ));
  }

  Widget _getCurrentWidget(id) {
    switch (id) {
      case 0:
        return ImagesView();
      case 1:
        return AnimationView();
      case 2:
        return VideoView();
      case 3:
        return AudioView();
      default:
        return ImagesView();
    }
  }

  void selectView(BuildContext context, int value) {
    context.read<PageBlock>().add(PageEvent.values[value]);
  }
}
