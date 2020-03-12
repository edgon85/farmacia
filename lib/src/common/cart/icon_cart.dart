import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconCart extends StatelessWidget {
  const IconCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
            icon: Icon(FontAwesomeIcons.shoppingBag),
            onPressed: () => Navigator.pushNamed(context, '/cart-page')),
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            child:
                Center(child: Text('1', style: TextStyle(color: Colors.white))),
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
          ),
        )
      ],
    );
  }
}
