import 'package:farm_app/src/common/gradient_widget.dart';
import 'package:farm_app/src/models/product/product_model.dart';
import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final product = Provider.of<ProductModel>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _customAppbar(),
              SliverList(
                  delegate: SliverChildListDelegate([
                _imageContainer(screenSize),
                _detailAndPrice(),
                SizedBox(
                  height: 20,
                ),
                _favButton(),
              ]))
            ],
          ),
          _buyButton(screenSize),
        ],
      ),
    );
  }

  // <========================================> //
  // Imagen //
  // <========================================> //
  Widget _imageContainer(Size screenSie) {
    return Placeholder(
      fallbackWidth: double.infinity,
      fallbackHeight: screenSie.height * 0.5,
    );
  }

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
  Widget _buyButton(Size screenSize) {
    return Stack(
      children: <Widget>[
        Positioned(
            bottom: 0.0,
            right: 0.0,
            child: InkWell(
              onTap: () => print('agregado a mis compras'),
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
