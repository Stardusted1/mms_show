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
