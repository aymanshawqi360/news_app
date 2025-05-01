import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/core/notworking/firebase_factory.dart';
import 'package:news_app/features/login/data/model/login_request_body.dart';

class LoginFirebaseServies {
  final FirebaseFactory _firebaseFactory;

  LoginFirebaseServies(this._firebaseFactory);

  Future<UserCredential> login(LoginRequestBody loginRequestBody) async {
    final response = await _firebaseFactory.firebaseAuth!
        .signInWithEmailAndPassword(
            email: loginRequestBody.email.toString(),
            password: loginRequestBody.password.toString());
    return response;
  }

  Future<void> logout() async {
    await _firebaseFactory.firebaseAuth!.signOut();
  }

  Future<void> forgotThepassword(LoginRequestBody loginRequestBody) async {
    await _firebaseFactory.firebaseAuth!.sendPasswordResetEmail(
      email: loginRequestBody.email.toString(),
    );
  }

  Future<UserCredential> signInWithGoogle(OAuthCredential credential) async {
    return await _firebaseFactory.firebaseAuth!
        .signInWithCredential(credential);
  }

  GoogleSignIn? signInWithGoogleDelete() {
    final response = _firebaseFactory.googleSignIn;
    return response;
  }
}
