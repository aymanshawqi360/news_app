import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/notworking/api_result.dart';
import 'package:news_app/core/notworking/firebase_error_handler.dart';
import 'package:news_app/features/login/data/firebase/login_firebase_servies.dart';
import 'package:news_app/features/login/data/model/login_request_body.dart';

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
}
