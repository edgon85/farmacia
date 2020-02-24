import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_app/src/models/product/incrementador_model.dart';
import 'package:farm_app/src/models/product/product_model.dart';
import 'package:farm_app/src/utils/color_app.dart';
import 'package:farm_app/src/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCardWidget extends StatelessWidget {
  final AsyncSnapshot data;
  final int index;

  const ProductCardWidget({Key key, @required this.data, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
    final counterProvider = Provider.of<CounterModel>(context);

    // print(product.productItem);
    String title = data.data.documents[index]['name'];
    String urlImage = data.data.documents[index]['imagePath'];
    double price = data.data.documents[index]['price'].toDouble();
    double discount = data.data.documents[index]['discount'].toDouble();

    return Container(
      //width: 200,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                GestureDetector(
                  // onTap: () => Navigator.pushNamed(context, '/product-detail'),

                  onTap: () {
                    counterProvider.setCounter(1);
                    product.productItem = new ProductItem(
                        data.data.documents[index]['_id'],
                        data.data.documents[index]['best_seller'],
                        data.data.documents[index]['category'],
                        data.data.documents[index]['detail'],
                        discount,
                        data.data.documents[index]['featured'],
                        urlImage,
                        title,
                        price,
                        data.data.documents[index]['subcategory']);

                    print(product.productItem.name);
                    Navigator.pushNamed(context, '/product-detail');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: urlImage,
                      // TODO: cambiar por una imagen de assets
                      placeholder: (contex, url) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 5,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/product-detail'),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          title,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.start,
                          style: headingTwoTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Q${price.toStringAsFixed(2)}',
                          textAlign: TextAlign.start,
                        ),
                        if (discount != 0)
                          Text(
                            'Q${discount.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough),
                          ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/product-detail'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: MaterialButton(
                    onPressed: () {},
                    height: 25.0,
                    color: ColorApp.accentColor,
                    shape: StadiumBorder(),
                    child: Text(
                      'Añadir',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
