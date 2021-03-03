part of images_lib;

class ImageCard extends StatelessWidget {
  final String url;
  final String title;
  final bool isLocal;
  final bool isAsset;

  const ImageCard({
    Key key,
    this.url,
    this.title,
    this.isLocal = false,
    this.isAsset = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleDesc(
          title: this.title,
          desc: this.url,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              !this.isAsset ? Image.network(this.url) : Image.asset(this.url),
        ),
      ],
    );
  }
}

class AssetsImage extends StatelessWidget {
  final String url;
  final String title;
  final bool isLocal;
  final bool isAsset;

  const AssetsImage({
    Key key,
    this.url,
    this.title,
    this.isLocal = false,
    this.isAsset = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleDesc(
          title: this.title,
          desc: this.url,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage(this.url)),
        ),
      ],
    );
  }
}

class LocalDriveImage extends StatefulWidget {
  @override
  _LocalDriveImageState createState() => _LocalDriveImageState();
}

class _LocalDriveImageState extends State<LocalDriveImage> {
  String _url = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleDesc(
          title: "Image from local drive",
          desc: this._url,
        ),
        CupertinoButton.filled(
            child: Icon(Icons.upload_file),
            onPressed: () {
              final params = OpenFileDialogParams(
                dialogType: OpenFileDialogType.image,
                sourceType: SourceType.savedPhotosAlbum,
              );
              FlutterFileDialog.pickFile(params: params).then((value) {
                if (value != null)
                  setState(() {
                    _url = value;
                  });
              });
            }),
        if (this._url != "")
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.file(File(this._url)),
          ),
      ],
    );
  }
}
