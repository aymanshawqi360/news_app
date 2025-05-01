import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseFactory {
  FirebaseFactory._();
  FirebaseAuth? firebaseAuth;
  GoogleSignIn? googleSignIn;

  FirebaseFactory() {
    firebaseAuth ??= FirebaseAuth.instance;
    googleSignIn ??= GoogleSignIn();
  }
}
