import 'package:farm_app/src/common/accounts/handle_error_firebase.dart';
import 'package:farm_app/src/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  final GoogleSignIn _googleSignIn;
  Status _status = Status.Uninitialized;
  String _authError;

  final firebaseUserProvider = UserProvider();
  final firebaseHerror = new HandleHerrorFirebase();

  UserRepository.instance()
      : _auth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn() {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  // getter status
  Status get status => _status;

  // getter user
  FirebaseUser get user => _user;

  // getter error
  String get authError => _authError;

  // Login
  Future<bool> loginEmailAndPassword(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      _authError = firebaseHerror.handleErrorAuth(e.code);
      notifyListeners();

      return false;
    }
  }

  // login with google
  Future<bool> loginWithGoogle() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      firebaseUserProvider.updateUserDataGoogle(_user);

      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      _authError = firebaseHerror.handleErrorAuth(e.code);
      notifyListeners();
      return false;
    }
  }

  // crear cuenta
  Future<bool> createAccount(String email, String password, String name) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();

      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      firebaseUserProvider.updateUserDataEmailAndPassword(_user, name, '');

      return true;
    } catch (e) {
      _status = Status.Unauthenticated;

      _authError = firebaseHerror.handleErrorAuth(e.code);

      print('authError => $e');
      notifyListeners();

      return false;
    }
  }

  // logout
  Future signOut() {
    _auth.signOut();
    _status = Status.Unauthenticated;

    notifyListeners();

    return Future.delayed(Duration.zero);
  }

  // state changed
  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }

    notifyListeners();
  }
}
