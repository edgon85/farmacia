import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi carrito'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text('Carrito de compras'),
        ),
      ),
    );
  }
}
