import 'package:farm_app/src/bloc/provider.dart';
import 'package:farm_app/src/pages/acounts/login_page.dart';
import 'package:farm_app/src/pages/container_page.dart';
import 'package:farm_app/src/utils/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'FarmApp',
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        /* theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
        initialRoute: 'login',
        routes: {
          'container': (BuildContext context) => ContainerPage(),
          'login': (BuildContext context) => LoginPage(),
        },
      ),
    );
  }
}


