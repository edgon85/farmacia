import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _fondo(context),
            _loginForm(context),
          ],
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(child: Container(
            height: size.height * 0.25,
          )),

          Container(
            width: size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              children: <Widget>[
                Text('Ingreso')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _fondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoAzul = Container(
      height: size.height * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: <Color>[ColorApp.primaryColor, ColorApp.darkPrimaryColor]),
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    final logo = Container(
      // TODO: Remplazar por el logo original
      padding: EdgeInsets.only(top: size.height * 0.07),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.person_pin_circle,
            color: Colors.white,
            size: size.height * 0.1,
          ),
          SizedBox(
            height: 10.0,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Farmapp',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
              Text('+', style: TextStyle(color: Colors.white, fontSize: 12.0)),
              Text(
                'gt',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ],
          )
        ],
      ),
    );


    return Stack(
      children: <Widget>[
        fondoAzul,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        logo
      ],
    );
  }
}
