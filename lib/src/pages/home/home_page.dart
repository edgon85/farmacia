import 'package:farm_app/src/common/cart/icon_cart.dart';
import 'package:farm_app/src/common/drawer.dart';
import 'package:farm_app/src/common/products/content_heading_widget.dart';
import 'package:farm_app/src/common/products/product_card_widget.dart';
import 'package:farm_app/src/pages/home/widgets/carouserl_widget.dart';
import 'package:farm_app/src/common/products/featured_product_widget.dart';
import 'package:farm_app/src/providers/product/product_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name;
  final productoProvider = new ProductProvider();

  HomePage({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PharmApp'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[_searchIcon(), IconCart()],
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
            child: StreamBuilder(
                stream: productoProvider.getBestSeller('best_seller'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    if (snapshot.data.documents.length != 0) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return FeaturedProductWidget(
                              imagePath: snapshot.data.documents[index]
                                  ['imagePath'],
                            );
                          });
                    } else {
                      return Container(
                        child: Text('No hay productos disponibles'),
                      );
                    }
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget _destacados(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
            child: StreamBuilder(
                stream: productoProvider.getBestSeller('featured'),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (snapshot.data.documents.length != 0) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: (.65)),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          return ProductCardWidget(
                            data: snapshot,
                            index: index,
                          );
                        },
                      );
                    } else {
                      return Container(
                        child: Text('Productos no disponibles'),
                      );
                    }
                  }
                }),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget _searchIcon() {
    return Container(
      child: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print('Buscar...');
          }),
    );
  }
}
