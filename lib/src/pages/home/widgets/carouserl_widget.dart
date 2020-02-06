
import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_app/src/providers/product/product_provider.dart';
import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CarouselWidget extends StatelessWidget {
  final banner = new ProductProvider();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 120.0,
          child: ClipPath(
            clipper: DiagonalPathClipperOne(),
            child: Container(
              height: 110,
              color: ColorApp.primaryColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: FutureBuilder(
            future: banner.getBannerFuture(),
            builder: (context, snapshot) {
              // TODO: cambiar por imagen de fondo
              if (!snapshot.hasData) {
                return Container(
                  child: Text('Cargando...'),
                );
              }

              return CarouselSlider.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return _bannerCard(context, snapshot.data[index]);
                },
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                //autoPlayCurve: Curves.fastOutSlowIn,
              );
            },
          ),
        )
      ],
    );
  }

  Widget _bannerCard(BuildContext context, String image) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fill,
            // TODO: cambiar por una imagen de assets
            placeholder: (contex, url){
              return Center(child: CircularProgressIndicator(),);
            },
            errorWidget: (context, url, error) => Icon(Icons.error),
          )
      ),
    );
  }
}
/*CachedNetworkImage(
                      imageUrl: urlImage,
                      // TODO: cambiar por una imagen de assets
                      placeholder: (contex, url){
                        return Center(child: CircularProgressIndicator(),);
                      },
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )*
*/