import 'package:farm_app/src/models/auth/slide.dart';
import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {

  final int index;


  SlideItem({@required this.index});

  @override
  Widget build(BuildContext context) {

    final imageHeight = MediaQuery.of(context).size;
    final imageWith = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: imageHeight.height * 0.4,
          width: imageWith.width * 0.8,
          decoration: BoxDecoration(
           //   shape: BoxShape.circle,
             // color: Colors.yellow,
            image: DecorationImage(image: AssetImage(slideList[index].imageUrl))
          ),

        ),
        SizedBox(
          height: 40,
        ),
        Text(
          slideList[index].title,
          style: TextStyle(fontSize: 22, color: ColorApp.primaryColor, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            slideList[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorApp.secondaryText),
          ),
        )
      ],
    );
  }
}

