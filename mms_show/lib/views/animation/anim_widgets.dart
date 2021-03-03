part of animation_lib;

class NetworkLottie extends StatelessWidget {
  final String _url =
      "https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleDesc(
          title: "Network Lottie animation",
          desc: _url,
        ),
        Lottie.network(
          _url,
          frameRate: FrameRate(60),
        ),
      ],
    );
  }
}

class AnimatedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          TitleDesc(
            title: "Animated text widget",
            desc: "using animated_text_kit plugin",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RotateAnimatedTextKit(
                  duration: Duration(milliseconds: 900),
                  repeatForever: true,
                  text: ["1", "2", "3", "4", "3", "2"],
                  textStyle: TextStyle(fontSize: 40.0, fontFamily: "Horizon")),
            ],
          )
        ],
      ),
    );
  }
}

class AnimatedWidg extends StatefulWidget {
  @override
  _AnimatedWidgState createState() => _AnimatedWidgState();
}

class _AnimatedWidgState extends State<AnimatedWidg> {
  WidgetData data = WidgetData();
  Random rnd;
  Timer timer;

  @override
  void initState() {
    super.initState();
    data.width = 50;
    data.height = 50;
    data.color = Colors.red;
    rnd = Random();
    timer = new Timer.periodic(Duration(milliseconds: 500), (timer) {
      _updateData();
    });
  }

  void _updateData() {
    int type = rnd.nextInt(4);
    switch (type) {
      case 0:
        setState(() {
          data.width = rnd.nextInt(40).toDouble() + 20;
        });
        break;
      case 2:
        setState(() {
          data.height = rnd.nextInt(40).toDouble() + 20;
        });
        break;
      case 3:
        setState(() {
          data.color = Color(rnd.nextInt(0x100000000));
        });
        break;
      default:
        setState(() {
          data.width = rnd.nextInt(40).toDouble() + 20;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleDesc(
          title: "AnimatedContainer widget",
          desc: "using flutter AnimatedContainer",
        ),
        AnimatedContainer(
          height: data.height,
          width: data.width,
          decoration: BoxDecoration(
              color: data.color,
              borderRadius: BorderRadius.all(Radius.circular(2))),
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          child: Icon(Icons.account_circle_outlined),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}

class WidgetData {
  double width;
  double height;
  Color color;
}
