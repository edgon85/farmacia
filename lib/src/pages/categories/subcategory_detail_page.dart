import 'package:farm_app/src/common/products/product_card_widget.dart';
import 'package:farm_app/src/providers/product/product_provider.dart';
import 'package:flutter/material.dart';

class SubcategoryDetailPage extends StatelessWidget {
  final String subcategoryId;
  final productoProvider = new ProductProvider();

  SubcategoryDetailPage({@required this.subcategoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: StreamBuilder(
              stream: productoProvider.getProductBySubategory(subcategoryId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (snapshot.data.documents.length != 0) {
                    return _gridVIewProducts(snapshot);
                  } else {
                    return Container(
                      child: Text('Productos no disponibles'),
                    );
                  }
                }
              }),
        ),
      ),
    );
  }

  // <================================================> //
  // grid view de productos
  // <================================================> //
  Widget _gridVIewProducts(AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: (.65)),
      itemCount: snapshot.data.documents.length,
      itemBuilder: (context, index) {
        return ProductCardWidget(data: snapshot, index: index,);
      },
    );
  }
}
