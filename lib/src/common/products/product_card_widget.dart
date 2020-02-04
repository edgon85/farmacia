import 'package:farm_app/src/utils/color_app.dart';
import 'package:farm_app/src/utils/text_style.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final String title;
  final String urlImage;
  final double price;
  final double discount;

  const ProductCardWidget(
      {Key key, this.title, this.urlImage, this.price, this.discount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 200,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(urlImage),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Q$price',
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '$discount',
                        style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
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
