import 'package:farm_app/src/models/auth/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserRepository>(context);

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(userProvider.user.email),
            RaisedButton(
              child: Text('Cerrar sesión'),
              onPressed: () => userProvider.signOut(),
            )
          ],
        ),
      ),
    );
  }
}
