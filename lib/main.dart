import 'package:farm_app/src/models/auth/user_repository.dart';
import 'package:farm_app/src/models/category/category_detail_model.dart';
import 'package:farm_app/src/models/product/incrementador_model.dart';
import 'package:farm_app/src/models/product/product_model.dart';
import 'package:farm_app/src/pages/acounts/getting_started_screen.dart';
import 'package:farm_app/src/pages/acounts/login_page.dart';
import 'package:farm_app/src/pages/acounts/register_page.dart';
import 'package:farm_app/src/pages/categories/category_detail_page.dart';
import 'package:farm_app/src/pages/container_page.dart';
import 'package:farm_app/src/pages/products/product_detail_page.dart';
import 'package:farm_app/src/pages/splash_screen.dart';
import 'package:farm_app/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserRepository.instance(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryDetailModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterModel(1),
        ),
      ],
      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmApp',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      /* theme: ThemeData(
      primarySwatch: Colors.blue,
    ),*/
      initialRoute: '/',
      routes: {
        '/': (context) {
          return Consumer<UserRepository>(
              // ignore: missing_return
              builder: (BuildContext context, user, child) {
            switch (user.status) {
              case Status.Uninitialized:
                return SplashScreenPage();
              case Status.Unauthenticated:
              case Status.Authenticating:
                return GettingStartedScreen();
              case Status.Authenticated:
                return ContainerPage();
            }
          });
        },
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/product-detail': (context) => ProductDetailPage(),
        '/category-detail': (context) => CategoryDetailPage(),
      },
    );
  }
}
