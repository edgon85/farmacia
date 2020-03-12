import 'package:flutter/material.dart';

class Cart {
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
}
