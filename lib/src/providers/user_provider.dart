import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider {
  final Firestore _db = Firestore.instance;

  void updateUserDataGoogle(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);
  }

  void updateUserDataEmailAndPassword(FirebaseUser user, String name, String photoURL) async {
    DocumentReference ref = _db.collection('users').document(user.uid);


    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': photoURL,
      'displayName': name,
      'lastSeen': DateTime.now()
    }, merge: true);
  }
}