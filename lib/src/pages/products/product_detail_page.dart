import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_app/src/common/gradient_widget.dart';
import 'package:farm_app/src/models/auth/user_repository.dart';
import 'package:farm_app/src/models/favorites/favoriteModel.dart';
import 'package:farm_app/src/models/product/incrementador_model.dart';
import 'package:farm_app/src/models/product/product_model.dart';
import 'package:farm_app/src/pages/favorites/widgets/favorite_button_widget.dart';
import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final product = Provider.of<ProductModel>(context);
    final user = Provider.of<UserRepository>(context);
    FavoriteModel favoriteModel = new FavoriteModel();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _customAppbar(),
              SliverList(
                  delegate: SliverChildListDelegate([
                _imageContainer(context, screenSize),
                _detailAndPrice(product),
                SizedBox(
                  height: 20,
                ),
                // _favButton(),
              ]))
            ],
          ),
          _buyButton(context, screenSize),
          FutureBuilder(
            future: favoriteModel.getFavByPruductAndUser(
                product.productItem.id, user.user.uid),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Text('...');
                case ConnectionState.waiting:
                  return new Text('Awaiting result...');
                default:
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  else
                    print('data_desde_furure => ${snapshot.hasData}');
                  return FavButton(
                    screenSize: screenSize,
                    hasData: snapshot.hasData,
                  );
              }
            },
          )
        ],
      ),
    );
  }

  // <========================================> //
  // Imagen //
  // <========================================> //
  Widget _imageContainer(BuildContext context, Size screenSie) {
    final screenHeight = screenSie.height * 0.4;

    return Container(
      height: screenHeight,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [ColorApp.primaryColor, ColorApp.accentColor]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
      child: _childImageContainer(context, screenHeight),
    );
  }

  Widget _childImageContainer(BuildContext context, double screen) {
    final counterProvider = Provider.of<CounterModel>(context);
    final product = Provider.of<ProductModel>(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // ==> Titulo
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Text(
              product.productItem.name,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
          // ==> Imagen y Aumentador
          Row(
            children: <Widget>[
              // ==> Imagen
              Expanded(
                  flex: 3,
                  child: Container(
                    height: screen - 60,
                    child: CachedNetworkImage(
                      imageUrl: product.productItem.imagePath,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  )),

              // ==> aumento, decremento
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: screen - (screen * 0.4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          counterProvider.increment();
                          print(counterProvider.getCounter());
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorApp.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${counterProvider.getCounter()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      InkWell(
                        onTap: () {
                          counterProvider.decrement();
                          print(counterProvider.getCounter());
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: Text('-',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
  // <========================================> //

  // <========================================> //
  // Detalle y precio //
  // <========================================> //
  Widget _detailAndPrice(ProductModel product) {
    return Container(
      // height: 150.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Detalle:',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    product.productItem.detail,
                    style: TextStyle(color: Colors.grey),
                  ),
                  /* Text(
                    'sdjfhasjkfdha kjshdfajsjfasksdlafjlksjdfñklasdfasdjfkñlasjdfk ����ladfjasdklñfjklañsdjfklas asjdfklajsfklñasjdfklñadsf ajksflñkjsaklñfjakslñjdf afasjkdfkalsjflkasjdflkjalskfjklasdjfklas sdjfhasjkfdha kjshdfajsjfasksdlafjlksjdfñklasdfasdjfkñlasjdfk ñladfjasdklñfjklañsdjfklas asjdfklajsfklñasjdfklñadsf ajksflñkjsaklñfjakslñjdf afasjkdfkalsjflkasjdflkjalskfjklasdjfklas sdjfhasjkfdha kjshdfajsjfasksdlafjlksjdfñklasdfasdjfkñlasjdfk ñladfjasdklñfjklañsdjfklas asjdfklajsfklñasjdfklñadsf ajksflñkjsaklñfjakslñjdf afasjkdfkalsjflkasjdflkjalskfjklasdjfklas sdjfhasjkfdha kjshdfajsjfasksdlafjlksjdfñklasdfasdjfkñlasjdfk ñladfjasdklñfjklañsdjfklas asjdfklajsfklñasjdfklñadsf ajksflñkjsaklñfjakslñjdf afasjkdfkalsjflkasjdflkjalskfjklasdjfklas',
                  ), */
                ],
              ),
            ),
          ),

          // ==>
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Q ${product.productItem.price.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    if (product.productItem.discount != 0)
                      Text(
                        'Q ${product.productItem.discount.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough),
                      ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  // <========================================> //
  // Boton de compra //
  // <========================================> //
  Widget _buyButton(BuildContext context, Size screenSize) {
    final counterProvider = Provider.of<CounterModel>(context);
    final product = Provider.of<ProductModel>(context);

    return Stack(
      children: <Widget>[
        Positioned(
            bottom: 0.0,
            right: 0.0,
            child: InkWell(
              onTap: () {
                print(
                  'agregado a mis compras => \nnombre: ${product.productItem.name},\nid: ${product.productItem.id}, \ncantidad: ${counterProvider.getCounter()}',
                );

                Navigator.pop(context);
              },
              child: Container(
                width: screenSize.width * 0.4,
                height: 75.0,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Comprar',
                      style: TextStyle(
                          color: ColorApp.textIcons,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: ColorApp.textIcons,
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }

  Widget _customAppbar() {
    return SliverAppBar(
      elevation: 0.0,
      floating: false,
      pinned: true,
      centerTitle: true,
      title: Text('Detalle del producto'),
      flexibleSpace:
          Container(decoration: GradientDecoration().gradientDecoraion()),
    );
  }
}
