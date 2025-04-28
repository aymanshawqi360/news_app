import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFactory {
  FirebaseFactory._();
  FirebaseAuth? firebaseAuth;

  FirebaseFactory() {
    firebaseAuth ??= FirebaseAuth.instance;
  }
}
