import 'dart:async';

import 'package:farm_app/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailControler = BehaviorSubject<String>();
  final _passwordControler = BehaviorSubject<String>();

  /*>=============================================================<*/
  /*Insertar valores al Stream<*/
  /*>=============================================================<*/
  Function(String) get changeSinkEmail => _emailControler.sink.add;

  Function(String) get changeSinkPassword => _passwordControler.sink.add;

  /*<=============================================================>*/

  /*>=============================================================<*/
  /*Recuperar los datos del Stream*/
  /*>=============================================================<*/
  Stream<String> get emailStream =>
      _emailControler.stream.transform(validarEmail);

  Stream<String> get passwordStream =>
      _passwordControler.stream.transform(validarPassword);

  /*<=============================================================>*/

  /*================================================================*/
  // validación del formulario //
  /*================================================================*/
  Stream<bool> get formValidStream => CombineLatestStream.combine2(
      emailStream, passwordStream, (email, password) => true);

  /*<=============================================================>*/

  /*================================================================*/
  // Obtener el último valor ingresado a los streams //
  /*================================================================*/
  String get email => _emailControler.value;

  String get password {
    return _passwordControler.value;
  }

  /*<=============================================================>*/

  /*>=============================================================<*/
  /*cerrar el Stream cuando no lo necesite*/
  /*>=============================================================<*/
  dispose() {
    _emailControler?.close();
    _passwordControler?.close();
  }
/*<=============================================================>*/

/*Stream<bool> get formValidStream =>
    CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);*/
}
