import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/notworking/api_result.dart';
import 'package:news_app/core/notworking/firebase_error_model.dart';
import 'package:news_app/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:news_app/features/sign_up/data/repo/signup_firebase_repo.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignupFirebaseRepo _signupFirebaseRepo;
  SignUpCubit(this._signupFirebaseRepo) : super(SignUpInitial());

  final emilController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  signUp() async {
    emit(SignUpLoading());
    final response = await _signupFirebaseRepo.signUp(SignUpRequestBody(
        email: emilController.text, password: passwordController.text));

    if (response is Success<String>) {
      emit(SignUpSuccess());
    } else if (response is Failure<String>) {
      emit(SignUpFailure(
          error: FirebaseErrorModel(message: response.error.toString())));
    }
  }

  signInWithGoogle() async {
    debugPrint("SignUpWithGoodleLoading===================");
    emit(SignUpWithGoogleLoading());
    final response = await _signupFirebaseRepo.signInWithGoogle();
    if (response is Success<String>) {
      debugPrint("SignUpWithGoodleSuccess===================");
      emit(SignUpWithGoogleSuccess(successFull: response.data.toString()));
    } else if (response is Failure<String>) {
      debugPrint("SignUpWithGoodleFailure===================");
      emit(SignUpWithGoogleFailure(
          error: FirebaseErrorModel(message: response.error.toString())));
    }
  }

  signUpWithFacebook() async {
    // log("LoginLoadingWithFacebook=========");
    emit(SignUpLoadingWithFacebook());
    final response = await _signupFirebaseRepo.signUpWithFacebook();
    if (response is Success<String>) {
      // log("LoginSuccessWithFacebook=========");

      emit(SignUpSuccessWithFacebook());
    } else if (response is Failure<String>) {
      // log("LoginFailureWithFacebook=========");
      emit(SignUpFailureWithFacebook(
          error: FirebaseErrorModel(message: response.error.toString())));
    }
  }
}
