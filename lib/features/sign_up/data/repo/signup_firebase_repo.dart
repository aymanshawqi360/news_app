import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/core/notworking/api_result.dart';
import 'package:news_app/core/notworking/firebase_error_handler.dart';
import 'package:news_app/core/notworking/firebase_error_model.dart';
import 'package:news_app/features/sign_up/data/firebase/signup_firebase_service.dart';
import 'package:news_app/features/sign_up/data/model/sign_up_request_body.dart';

class SignupFirebaseRepo {
  final SignupFirebaseService _signupFirebaseService;
  SignupFirebaseRepo(this._signupFirebaseService);

  Future<ApiResult<String>> signUp(SignUpRequestBody signUpRequestModel) async {
    try {
      final response = await _signupFirebaseService.signUp(signUpRequestModel);
      response.user!.sendEmailVerification();

      return ApiResult.success(response.toString());
    } catch (e) {
      //  log(FirebaseErrorHandler.handle(e).error.toString());
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    }
  }

  Future<ApiResult<String>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return ApiResult.failure(
            FirebaseErrorModel(error: "تسجيل الدخول ألغي من قبل المستخدم"));
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final response =
          await _signupFirebaseService.signInWithGoogle(credential);

      // final User? user = response.user;
      // if (user != null) {
      //   final isNew = response.additionalUserInfo!.isNewUser ?? false;
      //   if (isNew) {
      //     return ApiResult.success('👤 تم إنشاء حساب جديد بنجاح');
      //   } else {
      //     return ApiResult.success('✅ تسجيل دخول ناجح');
      //   }
      // } else {
      //   return ApiResult.failure(
      //       FirebaseErrorModel(error: '❌ فشل تسجيل الدخول'));
      // }
      return ApiResult.success(response.toString());
    } catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    }
  }
}
