import 'package:farm_app/src/models/cart/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Cart _cart;

  Cart get cart => _cart;

  set cart(Cart cart) {
    assert(cart != null);
    _cart = cart;

    notifyListeners();
  }
}
