import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/core/notworking/api_result.dart';
import 'package:news_app/core/notworking/firebase_error_handler.dart';
import 'package:news_app/core/notworking/firebase_error_model.dart';

import 'package:news_app/features/login/data/firebase/login_firebase_servies.dart';
import 'package:news_app/features/login/data/model/login_request_body.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class LoginFirebaseRepo {
  final LoginFirebaseServies _loginFirebaseServies;

  LoginFirebaseRepo(this._loginFirebaseServies);

  Future<ApiResult<UserCredential>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _loginFirebaseServies.login(loginRequestBody);
      // response.user!.sendEmailVerification();

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    }
  }

  Future<void> logout() async {
    final response = await _loginFirebaseServies.logout();
    ApiResult.success(response);
  }

  Future<ApiResult<String>> forgotThepassword(
      LoginRequestBody loginRequestBody) async {
    try {
      await _loginFirebaseServies.forgotThepassword(loginRequestBody);

      return ApiResult.success("");
    } catch (e) {
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

      log("Google_Email==========${googleUser.email.toString()}");
      log("Google_Name==========${googleUser.displayName.toString()}");
      log("Google_ServerAuth==========${googleUser.serverAuthCode.toString()}");

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final response = await _loginFirebaseServies.signInWithGoogle(credential);

      final User? user = response.user;
      if (user != null) {
        bool isNew = response.additionalUserInfo!.isNewUser ?? false;
        if (isNew) {
          return ApiResult.success('👤 تم إنشاء حساب جديد بنجاح');
        } else {
          return ApiResult.success('✅ تسجيل دخول ناجح');
        }
      } else {
        return ApiResult.success('❌ فشل تسجيل الدخول');
      }
    } catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GoogleSignInAccount?>> signInWithGoogleDelete() async {
    try {
      final response =
          await _loginFirebaseServies.signInWithGoogleDelete()!.disconnect();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    }
  }

  Future<ApiResult<String>> loginWithFacebook() async {
    //
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.accessToken == null) {
        return ApiResult.failure(FirebaseErrorModel(
            error: LocaleKeys
                    .PlatformException_FailedToConnectToTheServerCheckYourInternetConnection
                .tr()));
      }

      // final response = await _loginFirebaseServies
      //     .loginWithFacebook(loginResult.accessToken!.tokenString);

      // Trigger the sign-in flow
      // final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      // final OAuthCredential facebookAuthCredential =
      //     FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      // final response = await FirebaseAuth.instance
      //     .signInWithCredential(facebookAuthCredential);

      // final response = await _loginFirebaseServies.loginWithFacebook();
      // final OAuthCredential facebookAuthCredential =
      //     FacebookAuthProvider.credential(response.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      // final ddd = await FirebaseAuth.instance
      //     .signInWithCredential(facebookAuthCredential);

      // final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      final response =
          await _loginFirebaseServies.loginWithFacebook(facebookAuthCredential);

      return ApiResult.success(response.toString());
    } catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    }
  }
}
