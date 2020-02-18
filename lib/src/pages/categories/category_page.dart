import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_app/src/common/drawer.dart';
import 'package:farm_app/src/pages/categories/widgets/category_widget.dart';
import 'package:farm_app/src/pages/categories/widgets/sliber_appbar.dart';
import 'package:farm_app/src/providers/product/product_provider.dart';
import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = new ProductProvider();

    return Scaffold(
      drawer: DrawerMenu(),
      backgroundColor: ColorApp.backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          MySliberAppbar(),
          SliverList(
              delegate: SliverChildListDelegate([
            StreamBuilder<QuerySnapshot>(
                stream: categories.getAllCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.data.documents.length > 0) {

                      return CategoriesWidget(
                        documents: snapshot.data.documents,
                      );
                    }
                  }

                 // print(snapshot.data);
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }),
          ]))
        ],
      ),
    );
  }
}
