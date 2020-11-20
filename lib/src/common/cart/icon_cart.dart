import 'package:farm_app/src/models/cart/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class IconCart extends StatelessWidget {
  const IconCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCount = Provider.of<Cart>(context);

    return Stack(
      children: <Widget>[
        IconButton(
            icon: Icon(FontAwesomeIcons.shoppingBag),
            onPressed: () => Navigator.pushNamed(context, '/cart-page')),
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            child: Center(
                child: Text('${cartCount.count}',
                    style: TextStyle(color: Colors.white))),
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
