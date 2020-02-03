import 'package:farm_app/src/models/auth/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextStyle textStyle = TextStyle(fontFamily: 'Monserrat', fontSize: 20.0);
  TextEditingController _nameControler;
  TextEditingController _emailControler;
  TextEditingController _passwordControler;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _nameControler = TextEditingController(text: '');
    _emailControler = TextEditingController(text: '');
    _passwordControler = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context)  {
    final user = Provider.of<UserRepository>(context);

    return Scaffold(
      key: _key,
      body: Form(
          key: _formKey,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _nameControler,
                    validator: (value) =>
                    (value.isEmpty) ? 'Ingrese su nombre' : null,
                    style: textStyle,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Nombre',
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _emailControler,
                    validator: (value) => (value.isEmpty)
                        ? 'Ingrese su correo electrónico'
                        : null,
                    style: textStyle,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Correo electrónico',
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordControler,
                    validator: (value) =>
                    (value.isEmpty) ? 'Ingrese su contraseña' : null,
                    style: textStyle,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Contraseña',
                        border: OutlineInputBorder()),
                  ),
                ),
                user.status == Status.Authenticating
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.red,
                    child: MaterialButton(
                      child: Text(
                        'Registrarse',
                        style: textStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          if (!await user.createAccount(
                              _emailControler.text,
                              _passwordControler.text,
                              _nameControler.text)) {
                            _key.currentState.showSnackBar(SnackBar(
                              content: Text(user.authError),
                            ));
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                    child:
                    Center(child: Text('Cancelar')),
                    onTap: () => Navigator.pop(context))
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();
  }
}

