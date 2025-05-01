import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/notworking/firebase_factory.dart';
import 'package:news_app/features/sign_up/data/model/sign_up_request_body.dart';

class SignupFirebaseService {
  final FirebaseFactory _firebaseFactory;

  SignupFirebaseService(this._firebaseFactory);

  Future<UserCredential> signUp(SignUpRequestBody signUpRequestModel) async {
    final response = await _firebaseFactory.firebaseAuth!
        .createUserWithEmailAndPassword(
            email: signUpRequestModel.email.toString(),
            password: signUpRequestModel.password.toString());

    return response;
  }

  Future<UserCredential> signInWithGoogle(AuthCredential credential) async {
    final response =
        await _firebaseFactory.firebaseAuth!.signInWithCredential(credential);

    return response;
  }
}
