class HandleHerrorFirebase {

  //
  String handleErrorAuth(code) {
    String _authError;
    switch (code) {
      case "ERROR_INVALID_EMAIL":
        _authError =
        "Su dirección de correo electrónico parece estar mal formada.";
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        _authError =
        "La dirección de correo electrónico ya está en uso por otra cuenta.";
        break;
      case "ERROR_WRONG_PASSWORD":
        _authError = "Su contraseña es incorrecta";
        break;
      case "ERROR_USER_NOT_FOUND":
        _authError = "El usuario con este correo electrónico no existe.";
        break;
      case "ERROR_USER_DISABLED":
        _authError =
        "El usuario con este correo electrónico ha sido deshabilitado.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        _authError = "Demasiadas solicitudes Intenta nuevamente más tarde.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        _authError =
        "Iniciar sesión con correo electrónico y contraseña no está habilitado.";
        break;
      default:
        _authError = "Ocurrió un error :(";
    }
    return _authError;
  }
}