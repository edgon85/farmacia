import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_app/src/utils/text_style.dart';
import 'package:flutter/material.dart';

class FeaturedProductWidget extends StatelessWidget {
  final String imagePath;

  const FeaturedProductWidget({Key key, @required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      padding: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
      child: Stack(
        children: <Widget>[
          Container(
            width: 150,
            height: 200,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: Offset(2.0, 12.0)),
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.fill,
                    // TODO: cambiar por una imagen de assets
                    placeholder: (contex, url){
                      return Center(child: CircularProgressIndicator(),);
                    },
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                )),
          ),
          Positioned(
            bottom: 8,
            right: 20,
            left: 20,
            child: InkWell(
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                elevation: 4,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      'ver',
                      style: playWhiteTextStyle,
                      textAlign: TextAlign.center,
                    )),
              ),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
