import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageDivider extends StatelessWidget {
  const PageDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: 10,
      indent: 10,
      color: Colors.black,
    );
  }
}

class TitleDesc extends StatelessWidget {
  final desc;
  final title;

  const TitleDesc({Key key, this.desc, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        if (desc != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SelectableText(desc),
          ),
      ],
    );
  }
}
