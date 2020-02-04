
import 'package:farm_app/src/models/auth/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _crearMenu(context);
  }
}

Drawer _crearMenu(BuildContext context){

  final user = Provider.of<UserRepository>(context);

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        _draweHeader(),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Inicio'),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.bookmark_border),
          title: Text('Mis órdenes'),
          onTap: (){},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Mi cuenta'),
          onTap: (){},
        ),
        Divider(),ListTile(
          leading: Icon(Icons.help_outline),
          title: Text('Ayuda'),
          onTap: (){},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings_applications),
          title: Text('Ajustes'),
          onTap: (){},
        ),
        Divider(),
        ListTile(
//          leading: Icon(Icons.power_settings_new),
          leading: Icon(FontAwesomeIcons.powerOff, color: Colors.red,),
          title: Text('Cerrar sesión', style: TextStyle(color: Colors.redAccent),),
          onTap: () => user.signOut(),
        ),
      ],
    ),
  );
}

Widget _draweHeader(){
  return DrawerHeader(
    decoration: BoxDecoration(
        color: Colors.redAccent
    ),
    child: Container(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ListTile(
          leading: CircleAvatar(
            child: Text('SL'),
            backgroundColor: Colors.brown,
          ),
          title: Text('Juan Pablo Bonilla'),
          subtitle: Text('correo@ejemplo.com'),
        ),
      ),
    ),
  );
}