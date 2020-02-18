import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_app/src/common/products/product_card_widget.dart';
import 'package:farm_app/src/models/category/category_detail_model.dart';
import 'package:farm_app/src/providers/product/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  CategoriesWidget({Key key, @required this.documents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 8.0, bottom: 8),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: documents.length,
      itemBuilder: (BuildContext context, int index) {
        return _categories(
            context, documents[index]['name'], documents[index]['_id']);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.blueAccent.withOpacity(0.15),
          height: 8.0,
        );
      },
    );
  }

  // <======================================================> //
  // Lista de categorias //
  // <======================================================> //
  Widget _categories(BuildContext context, String category, String categoryId) {
    final categoryDetail = Provider.of<CategoryDetailModel>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      height: 350,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  category,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    categoryDetail.categoryName = category;
                    categoryDetail.categoryId = categoryId;
                    Navigator.pushNamed(context, '/category-detail');
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Divider(),
          _listHorizontal(categoryId)
        ],
      ),
    );
  }

  // <======================================================> //
  // Lista horizontal de cards de productos //
  // <======================================================> //
  Widget _listHorizontal(String categoryId) {
    final categories = new ProductProvider();

    return StreamBuilder<QuerySnapshot>(
        stream: categories.getProductByCategory(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data.documents.length > 0) {
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      //  return Text(snapshot.data.documents[index]['name']);
                      return Container(
                        width: 200,
                        height: 290,
                        child: ProductCardWidget(
                          title: snapshot.data.documents[index]['name'],
                          urlImage: snapshot.data.documents[index]['imagePath'],
                          price: snapshot.data.documents[index]['price']
                              .toDouble(),
                          discount: snapshot.data.documents[index]['discount']
                              .toDouble(),
                        ),
                      );
                    }),
              );
            }
          }
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
