import 'package:farm_app/src/models/product/product_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List<CartItem> _carts = [];
  double _total = 0.0;

  void add(CartItem cartItem) {
    _carts.add(cartItem);
    _total += cartItem.subtotal;
  }

  void remove(CartItem cartItem) {
    _total -= cartItem.subtotal;
    _carts.remove(cartItem);
  }

  int get count {
    return _carts.length;
  }

  double get total {
    return _total;
  }

  List<CartItem> get bascketItems {
    return _carts;
  }
}

class CartItem {
  final String id;
  final int quanity;
  final ProductItem productItem;
  final double subtotal;

  CartItem({this.id, this.quanity, this.productItem})
      : subtotal = productItem.price * quanity,
        super();
}

/* class Cart {
  final String userUid;
  final String productId;
  final String productName;
  final String productImage;
  final double price;
  final double discount;
  final int cuantity;

  Cart(
      {@required this.userUid,
      @required this.productId,
      @required this.productName,
      @required this.productImage,
      @required this.price,
      @required this.discount,
      @required this.cuantity});

  factory Cart.fromJson(Map<String, dynamic> json) => new Cart(
      userUid: json['userUid'],
      productId: json['productId'],
      productName: json['productName'],
      productImage: json['productImage'],
      price: json['price'],
      discount: json['discount'],
      cuantity: json['cuantity']);

  Map<String, dynamic> toJson() => {
        'userUid': userUid,
        'productId': productId,
        'productName': productName,
        'productImage': productImage,
        'price': price,
        'discount': discount,
        'cuantity': cuantity,
      };
} */
