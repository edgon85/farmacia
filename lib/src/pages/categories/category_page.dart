import 'package:farm_app/src/common/drawer.dart';
import 'package:farm_app/src/pages/categories/widgets/sliber_appbar.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      body: CustomScrollView(
        slivers: <Widget>[
          MySliberAppbar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Placeholder(
              fallbackHeight: 1000,
            )
          ]))
        ],
      ),
    );
  }
}
