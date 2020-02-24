import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_app/src/common/gradient_widget.dart';
import 'package:farm_app/src/models/product/incrementador_model.dart';
import 'package:farm_app/src/models/product/product_model.dart';
import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _customAppbar(),
              SliverList(
                  delegate: SliverChildListDelegate([
                _imageContainer(context, screenSize),
                _detailAndPrice(),
                SizedBox(
                  height: 20,
                ),
                _favButton(),
              ]))
            ],
          ),
          _buyButton(context, screenSize),
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
                  height: 200,
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
  Widget _detailAndPrice() {
    return Container(
      height: 100.0,
      child: Row(
        children: <Widget>[
          Expanded(flex: 2, child: Placeholder()),
          Expanded(flex: 1, child: Placeholder())
        ],
      ),
    );
  }

  // <========================================> //
  // Boton de favorito //
  // <========================================> //
  Widget _favButton() {
    return Row(
      children: <Widget>[
        Spacer(),
        Placeholder(
          fallbackHeight: 50.0,
          fallbackWidth: 200.0,
        ),
        Spacer(),
      ],
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
                      'Agregar',
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
      title: Text('Detalle del producto'),
      flexibleSpace:
          Container(decoration: GradientDecoration().gradientDecoraion()),
    );
  }
}

/* Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 300,
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Image(
                          image: NetworkImage(product.productItem.imagePath),
                          fit: BoxFit.fill,
                        ))
                  ],
                ),
              ),
              // <====
              Container(color: Colors.white, child: Divider()),
              // <====
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(product.productItem.name),
                  subtitle: Text(product.productItem.detail),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Q ${product.productItem.price}'),
                      Text(
                        'Q ${product.productItem.discount}',
                        style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
             // color: Colors.red,
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      child: Padding(
                          padding: EdgeInsets.all(8.0)

                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      // color: Colors.yellow,
                      child: MaterialButton(
                        onPressed: () {},
                        // height: 25.0,
                        color: ColorApp.accentColor,
                        shape: StadiumBorder(),
                        child: Text(
                          'Añadir',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ), */
