import 'package:flutter/material.dart';

class Favorites {
  // final int id;
  final String productId;
  final String userUid;
  final String name;
  final String image;
  final String detail;

  Favorites(
      {
      // this.id,
      @required this.productId,
      @required this.userUid,
      @required this.name,
      @required this.image,
      @required this.detail});

  factory Favorites.fromJson(Map<String, dynamic> json) => new Favorites(
        // id: json['id'],
        productId: json['productId'],
        userUid: json['userUid'],
        name: json['name'],
        image: json['image'],
        detail: json['detail'],
      );

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'productId': productId,
        'userUid': userUid,
        'name': name,
        'image': image,
        'detail': detail
      };
}
