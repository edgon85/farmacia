import 'package:farm_app/src/common/drawer.dart';
import 'package:farm_app/src/common/products/content_heading_widget.dart';
import 'package:farm_app/src/common/products/product_card_widget.dart';
import 'package:farm_app/src/models/auth/user_repository.dart';
import 'package:farm_app/src/models/product/product_model.dart';
import 'package:farm_app/src/pages/home/widgets/carouserl_widget.dart';
import 'package:farm_app/src/common/products/featured_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String name;

  HomePage({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FarmApp'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: DrawerMenu(),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  CarouselWidget(),
                  _seccionMasComprados(),
                  _destacados(context)
                ],
              ),
            ),
          ),
          // SafeArea(child: _customAppbar(context))
        ],
      ),
    );
  }

  Widget _seccionMasComprados() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: ContentHeadingWidget(
                  heading: 'Más vendidos',
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (var i = 0; i < featuredProductsList.length; i++)
                    FeaturedProductWidget(
                        imagePath: featuredProductsList[i].imagePath),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _destacados(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 2;
    final double itemWidth = size.width / 2;

    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: ContentHeadingWidget(
                  heading: 'Destacados',
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: (.65),
              children: <Widget>[
                for (var i = 0; i < featuredProductsList2.length; i++)
                  ProductCardWidget(
                    title: featuredProductsList2[i].name,
                    urlImage: featuredProductsList2[i].imagePath,
                    price: featuredProductsList2[i].price,
                    discount: featuredProductsList2[i].discount,
                  )
              ],
              crossAxisCount: 2,
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
