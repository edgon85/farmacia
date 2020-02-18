import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_app/src/common/gradient_widget.dart';
import 'package:farm_app/src/models/category/category_detail_model.dart';
import 'package:farm_app/src/pages/categories/subcategory_detail_page.dart';
import 'package:farm_app/src/providers/product/product_provider.dart';
import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/sliver_appbar_delegate_widget.dart';

class CategoryDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryDetail = Provider.of<CategoryDetailModel>(context);

    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: _bodyCategoryDetail(
          categoryTitle: categoryDetail.categoryName,
          categoryID: categoryDetail.categoryId),
    );
  }

  //<================================================>//
  // SiberApbar //
  //<================================================>//
  Widget _appbar(String title) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      elevation: 0.0,
      title: Text(title),
      flexibleSpace: Container(
        decoration: GradientDecoration().gradientDecoraion(),
      ),
    );
  }

  //<================================================>//
  // Body category detail //
  //<================================================>//
  Widget _bodyCategoryDetail({String categoryTitle, String categoryID}) {
    final categories = new ProductProvider();

    return StreamBuilder<QuerySnapshot>(
        stream: categories.getAllSubcategories(categoryID),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data.documents.length > 0) {
              List<String> titleSubcategories = [];
              List<String> idSubcategories = [];

              for (var i = 0; i < snapshot.data.documents.length; i++) {
                titleSubcategories.add(snapshot.data.documents[i]['name']);
                idSubcategories.add(snapshot.data.documents[i]['_id']);
              }

              return DefaultTabController(
                  length: snapshot.data.documents.length,
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        _appbar(categoryTitle),
                        _sliverPersistent(titleSubcategories)
                      ];
                    },
                    body: Container(
                      child: TabBarView(children: <Widget>[
                        for (var i = 0; i < idSubcategories.length; i++)
                          SubcategoryDetailPage(
                            subcategoryId: idSubcategories[i],
                          ),


                      ]),
                    ),
                  ));
            }
          }
          return Container(
            child: Center(
              child: Text('No hay datos :('),
            ),
          );
        });
  }

  //<================================================>//
  // SliverPersistent //
  //<================================================>//
  Widget _sliverPersistent(List subcatTile) {
    return SliverPersistentHeader(
      delegate: SliverAppBarDelegate(
        TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.black38,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 4.0, color: Colors.redAccent),
          ),
          labelStyle: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
          isScrollable: true,
          tabs: [
            for (var i = 0; i < subcatTile.length; i++)
              Tab(
                text: subcatTile[i].toUpperCase(),
              ),
          ],
        ),
      ),
      pinned: true,
    );
  }
}
