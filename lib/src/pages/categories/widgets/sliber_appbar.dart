import 'package:farm_app/src/common/gradient_widget.dart';
import 'package:farm_app/src/pages/categories/widgets/container_spacebar.dart';
import 'package:flutter/material.dart';

class MySliberAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var top = 00.0;
    return SliverAppBar(
      elevation: 0.0,
      expandedHeight: 120.0,
      floating: false,
      pinned: true,
      flexibleSpace: _flexibleSpaceBar(top),
    );
  }

  //<===========================================================>//
  // Crea el flexibleSpacebar //
  //<===========================================================>//
  Widget _flexibleSpaceBar(double top) {
    return Container(
      decoration: GradientDecoration().gradientDecoraion(),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        top = constraints.biggest.height;
        return FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(bottom: 10, left: 60, right: 25),
          centerTitle: true,
          title: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: top <= 120.0 ? 1.0 : 0.0,
            //opacity: 1.0,
            child: _searchAppBar(),
          ),
          background: ContainerSiberAppBar(),
          collapseMode: CollapseMode.parallax,
        );
      }),
    );
  }

  //<===========================================================>//
  // buscador dentro del appbar //
  //<===========================================================>//
  Widget _searchAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: GestureDetector(
        onTap: () => print('search => navbar colapsados'),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white70, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
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
        ),
      ),
    );
  }
}
