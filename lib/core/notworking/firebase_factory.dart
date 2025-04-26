import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFactory {
  FirebaseAuth? firebaseAuth;
  FirebaseFactory() {
    firebaseAuth ??= FirebaseAuth.instance;
  }
}
