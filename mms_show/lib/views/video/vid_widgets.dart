part of video_lib;

class VideoWidget extends StatefulWidget {
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  final _url =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(_url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleDesc(
          title: "Video from url",
          desc: _url,
        ),
        _controller.value.initialized
            ? GestureDetector(
                onTap: () => !_controller.value.isPlaying
                    ? _controller.play()
                    : _controller.pause(),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
            : CupertinoActivityIndicator()
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class VideoWidgetAsset extends StatefulWidget {
  @override
  _VideoWidgetAssetState createState() => _VideoWidgetAssetState();
}

class _VideoWidgetAssetState extends State<VideoWidgetAsset> {
  final _url = "assets/video/vid.mp4";

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(_url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleDesc(
          title: "Video from url",
          desc: _url,
        ),
        _controller.value.initialized
            ? GestureDetector(
                onTap: () => !_controller.value.isPlaying
                    ? _controller.play()
                    : _controller.pause(),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
            : CupertinoActivityIndicator()
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class VideoWidgetLocal extends StatefulWidget {
  @override
  _VideoWidgetLocalState createState() => _VideoWidgetLocalState();
}

class _VideoWidgetLocalState extends State<VideoWidgetLocal> {
  String _url = "";

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  void _loadFile() {
    final params = OpenFileDialogParams(
      dialogType: OpenFileDialogType.image,
      sourceType: SourceType.savedPhotosAlbum,
    );
    FlutterFileDialog.pickFile(params: params).then((value) {
      if (value != null)
        setState(() {
          _url = value;
        });
      _initController();
    });
  }

  void _initController() {
    _controller = VideoPlayerController.file(File(_url))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleDesc(
          title: "Video from local drive",
          desc: _url,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoButton.filled(
              child: Icon(Icons.upload_file), onPressed: () => _loadFile()),
        ),
        _controller != null && _controller.value.initialized && _url != ""
            ? GestureDetector(
                onTap: () => !_controller.value.isPlaying
                    ? _controller.play()
                    : _controller.pause(),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
            : CupertinoActivityIndicator()
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
