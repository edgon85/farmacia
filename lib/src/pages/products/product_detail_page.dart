import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle de producto'),),
      body: Container(
        child: Center(child: Text('page detail'),),
      ),
    );
  }
}
