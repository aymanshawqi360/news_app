import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseFactory {
  // FirebaseFactory._();
  FirebaseAuth? firebaseAuth;
  GoogleSignIn? googleSignIn;
  FacebookAuth? facebookAuth;

  FirebaseFactory() {
    firebaseAuth ??= FirebaseAuth.instance;
    googleSignIn ??= GoogleSignIn();
    facebookAuth ??= FacebookAuth.instance;
  }
}
