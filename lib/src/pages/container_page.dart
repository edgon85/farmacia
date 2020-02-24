import 'package:farm_app/src/pages/categories/category_page.dart';
import 'package:farm_app/src/pages/favorites/favorites_page.dart';
import 'package:farm_app/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  int _currentIndex = 0;

  final _home = HomePage(
    name: '',
  );
  final _category = CategoryPage();
  final _favorites = FavoritePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*==============================*/
      /*Body*/
      /*==============================*/
      body: _pageChooser(_currentIndex),
      /*==============================*/

      /*<============================>*/
      /*Bottom Bar*/
      /*<============================>*/
      bottomNavigationBar: _bottomBar(),
      /*>============================<*/
    );
  }

  /*==============================*/
  /*Bottom Bar*/
  /*==============================*/
  Widget _bottomBar() {
    return BottomNavigationBar(
      elevation: 4,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Inicio')),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), title: Text('Categorías')),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), title: Text('Favoritos')),
      ],
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
    );
  }

  /*==============================*/
  /* Seleccionar la página para el bottom bar */
  /*==============================*/
  Widget _pageChooser(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return _home;
        break;

      case 1:
        return _category;
        break;

      case 2:
        return _favorites;
        break;

      default:
        return _home;
    }
  }
}
