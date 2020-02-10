import 'package:flutter/material.dart';

class ContainerSiberAppBar extends StatelessWidget {
  const ContainerSiberAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _titleAppBarCategory(),
                  // SizedBox(height: 10,),
                  _searchAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //<===========================================================>//
  // Titulo del appbar //
  //<===========================================================>//
  Widget _titleAppBarCategory() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        'Categorías',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white70),
      ),
    );
  }

//<===========================================================>//
// buscador dentro del appbar //
//<===========================================================>//

  Widget _searchAppBar() {
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5, bottom: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white70, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 12.0),
            child: Icon(
              Icons.search,
              color: Colors.white70,
            ),
          ),
          Text(
            'Buscar productos',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          )
        ],
      ),
    );
  }

}
