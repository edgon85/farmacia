import 'package:flutter/cupertino.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide(
      {@required this.imageUrl,
      @required this.title,
      @required this.description});
}


final slideList = [
  Slide(imageUrl: 'assets/images/slides/slide_one.png', title: 'Pide desde EEUU', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ut vulputate lacus. Nam suscipit, risus at sagittis facilisis, quam magna commodo quam, ac feugiat nunc erat quis nulla'),
  Slide(imageUrl: 'assets/images/slides/slide_two.png', title: 'Entrega rápida en GT', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ut vulputate lacus. Nam suscipit, risus at sagittis facilisis, quam magna commodo quam, ac feugiat nunc erat quis nulla'),
  Slide(imageUrl: 'assets/images/slides/slide_three.png', title: 'Recibe en tu puerta', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ut vulputate lacus. Nam suscipit, risus at sagittis facilisis, quam magna commodo quam, ac feugiat nunc erat quis nulla'),
];