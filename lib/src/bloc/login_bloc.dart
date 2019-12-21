import 'dart:async';

class LoginBloc {
  final _emailControler = StreamController<String>.broadcast();
  final _passwordControler = StreamController<String>.broadcast();

  /*>=============================================================<*/
  /*Insertar valores al Stream<*/
  /*>=============================================================<*/
  Function(String) get changeSinkEmail => _emailControler.sink.add;

  Function(String) get changeSinkPassword => _passwordControler.sink.add;

  /*<=============================================================>*/

  /*>=============================================================<*/
  /*Recuperar los datos del Stream*/
  /*>=============================================================<*/
  Stream<String> get emailStream => _emailControler.stream;

  Stream<String> get passwordStream => _passwordControler.stream;

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
