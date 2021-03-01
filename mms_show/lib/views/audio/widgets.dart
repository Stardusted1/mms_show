part of audio_lib;

class LocalFilePlayer extends StatefulWidget {
  @override
  _LocalFilePlayerState createState() => _LocalFilePlayerState();
}

class _LocalFilePlayerState extends State<LocalFilePlayer> {
  String _url = "";
  AudioPlayer _audioPlayer =
      AudioPlayer(mode: PlayerMode.MEDIA_PLAYER, playerId: "1");
  final params = OpenFileDialogParams(
    dialogType: OpenFileDialogType.document,
    sourceType: SourceType.savedPhotosAlbum,
  );

  loadFile() {
    try {
      FlutterFileDialog.pickFile(params: params).then((value) {
        if (value != null)
          setState(() {
            _url = value;
          });
      });
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Err while opening data"),
      ));
    }
  }

  play() {
    _audioPlayer.play(_url, isLocal: true).then((value) {
      if (value == 1) {}
    });
  }

  pause() {
    _audioPlayer.pause().then((value) {
      if (value == 1) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Local track",
          style: Theme.of(context).textTheme.headline6,
        ),
        if (_url != "")
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16),
            child: SelectableText(_url),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoButton.filled(
              child: Icon(Icons.upload_file), onPressed: () => loadFile()),
        ),
        if (_url != "")
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CupertinoButton.filled(
                  child: Icon(Icons.play_arrow_outlined),
                  onPressed: () => play()),
              CupertinoButton.filled(
                onPressed: () => pause(),
                child: Icon(Icons.pause_outlined),
              ),
            ],
          ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.release();
    _audioPlayer.dispose();
  }
}

class WebUrlPlayer extends StatefulWidget {
  @override
  _WebUrlPlayerState createState() => _WebUrlPlayerState();
}

class _WebUrlPlayerState extends State<WebUrlPlayer> {
  final url =
      "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_5MG.mp3";

  AudioPlayer audioPlayer =
      AudioPlayer(mode: PlayerMode.MEDIA_PLAYER, playerId: "1");

  double length = 1.0;

  @override
  void initState() {
    super.initState();
    audioPlayer.setUrl(url);
  }

  play() {
    audioPlayer.play(url).then((value) {
      if (value == 1) {}
    });
  }

  pause() {
    audioPlayer.pause().then((value) {
      if (value == 1) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Web track",
          style: Theme.of(context).textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16),
          child: SelectableText(url),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CupertinoButton.filled(
                child: Icon(Icons.play_arrow_outlined),
                onPressed: () => play()),
            CupertinoButton.filled(
              onPressed: () => pause(),
              child: Icon(Icons.pause_outlined),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }
}
