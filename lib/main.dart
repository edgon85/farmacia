import 'package:farm_app/src/pages/container_page.dart';
import 'package:farm_app/src/utils/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parmapp',
      debugShowCheckedModeBanner: false,
     theme: appTheme(),
     /* theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      initialRoute: 'container',
      routes: {
        'container': (BuildContext context) => ContainerPage()
      },
    );
  }
}

