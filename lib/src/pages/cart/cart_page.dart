import 'package:farm_app/src/models/cart/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mi carrito'),
        centerTitle: true,
      ),
      body: cart.bascketItems.length == 0
          ? Container(
              child: Center(
                child: Text('Carrito de compras'),
              ),
            )
          : ListView.builder(
              itemCount: cart.bascketItems.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                      leading: Image(image: NetworkImage(cart.bascketItems[index].productItem.imagePath),),
                  title: Text(cart.bascketItems[index].productItem.name),
                  trailing: Container(
                    child: Column(
                      children: <Widget>[
                        Text('${cart.bascketItems[index].productItem.price}'),
                        Text('${cart.bascketItems[index].quanity}'),
                        Text('${cart.bascketItems[index].subtotal}'),
                      ],
                    ),
                  ),
                ));
              }),
    );
  }
}
