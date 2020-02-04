import 'package:farm_app/src/utils/text_style.dart';
import 'package:flutter/material.dart';

class ContentHeadingWidget extends StatelessWidget {
  final String heading;

  const ContentHeadingWidget({Key key, @required this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        heading,
        style: headingOneTextStyle,
      ),
    );
  }
}
