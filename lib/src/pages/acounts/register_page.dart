import 'package:farm_app/src/bloc/login_bloc.dart';
import 'package:farm_app/src/bloc/provider.dart';
import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _fondo(context),
            // _loginContainer(context),
          ],
        ),
      ),
    );
  }

  Widget _loginContainer(BuildContext context) {
    // creo una instancia de provider
    final bloc = Provider.of(context);

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: size.height * 0.20,
          )),
          /*>===============================================<*/
          /*Contenedor de formulario*/
          /*>===============================================<*/
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0),
                ]),
            child: Column(
              children: <Widget>[
                /*>===============================================<*/
                /*Texto de ingreso*/
                /*>===============================================<*/
                Text(
                  'Crear cuenta',
                  style: TextStyle(fontSize: 20.0),
                ),
                /*<===============================================>*/
                SizedBox(
                  height: 40.0,
                ),
                /*>===============================================<*/
                /*inputs del login*/
                /*>===============================================<*/
                _emailInput(bloc),
                SizedBox(
                  height: 30.0,
                ),
                _passwordInput(bloc),
                SizedBox(
                  height: 30.0,
                ),
                _buttonLogin(bloc, context),
                /*<===============================================>*/
              ],
            ),
          ),

          /*>===============================================<*/
          /*Crear cuenta, recuperar contraseña*/
          /*>===============================================<*/
          FlatButton(
            child: Text('Iniciar Sesión'),
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          ),
          SizedBox(
            height: 40.0,
          ),
          Text('¿Olvido la contraseña?'),
          /*>===============================================<*/

          SizedBox(
            height: 50.0,
          ) // <= espacio en el botton para hacer scroll
        ],
      ),
    );
  }

  /*>===============================================<*/
  /*email input login*/
  /*>===============================================<*/
  Widget _emailInput(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon:
                      Icon(Icons.alternate_email, color: ColorApp.accentColor),
                  hintText: 'correo@tucorreo.com',
                  labelText: 'Correo electrónico',
                  counterText: snapshot.data,
                  errorText: snapshot.error),

              /*============================================*/
              // enviamos el cambio que hay en el input
              /*============================================*/
              onChanged: (value) => bloc.changeSinkEmail(value),
              /*============================================*/
            ),
          );
        });
  }

  /*<===============================================>*/

  /*>===============================================<*/
  /*password input login*/
  /*>===============================================<*/
  Widget _passwordInput(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline, color: ColorApp.accentColor),
                  labelText: 'Contraseña',
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              /*============================================*/
              // enviamos el cambio que hay en el input
              /*============================================*/
              onChanged: (value) => bloc.changeSinkPassword(value),
              /*============================================*/
            ),
          );
        });
  }

  /*<===============================================>*/

  /*>===============================================<*/
  /*button login*/
  /*>===============================================<*/
  Widget _buttonLogin(LoginBloc bloc, BuildContext context) {
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Ingresar'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 0.0,
            textColor: Colors.white,
            color: ColorApp.accentColor,
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
          );
        });
  }

  _login(LoginBloc bloc, BuildContext context) {
    print('=============');
    print('Email: ${bloc.email}');
    print('Password: ${bloc.password}');
    print('=============');
    Navigator.pushReplacementNamed(context, 'container');
  }

  /*<===============================================>*/

  /*>===============================================<*/
  /*Fondo del login*/
  /*>===============================================<*/
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
