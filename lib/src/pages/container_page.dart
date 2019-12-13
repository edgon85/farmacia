import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*<============================>*/
      /*Appbar*/
      /*<============================>*/
      appBar: AppBar(
        title: Text('Parmapp'),
      ),
      /*>============================<*/

      /*==============================*/
      /*Body*/
      /*==============================*/
      body: Container(
        child: Center(
          child: Text('Home page'),
        ),
      ),
      /*==============================*/

      bottomNavigationBar: _bottomBar(),
    );
  }

  /*==============================*/
  /*Bottom Bar*/
  /*==============================*/
  Widget _bottomBar() {
    return BottomNavigationBar(elevation: 4, items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Inicio')),
      BottomNavigationBarItem(
          icon: Icon(Icons.category), title: Text('Categorías')),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite), title: Text('Favoritos')),
    ]);
  }
}
