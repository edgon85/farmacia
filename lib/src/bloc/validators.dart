import 'dart:async';

import 'package:flutter/material.dart';

class Validators {
  /*=====================================================================*/
  // Validar email
  /*=====================================================================*/
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    /*patern para la expresion regular*/
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    /* Crear la expresion regular */
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no es correcto');
    }
  });

  /*=====================================================================*/
  // Validar password
  /*=====================================================================*/
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Más de 6 caracteres por favor');
    }
  });
}
