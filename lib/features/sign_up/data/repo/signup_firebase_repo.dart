import 'package:news_app/core/notworking/api_result.dart';
import 'package:news_app/core/notworking/firebase_error_handler.dart';
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
}
