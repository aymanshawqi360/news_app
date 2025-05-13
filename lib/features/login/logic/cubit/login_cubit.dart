import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/core/notworking/api_result.dart';
import 'package:news_app/core/notworking/firebase_error_model.dart';
import 'package:news_app/features/login/data/model/login_request_body.dart';
import 'package:news_app/features/login/data/repo/login_firebase_repo.dart';
import 'package:news_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginFirebaseRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  final emilController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(LoginLoading());
    final response = await _loginRepo.login(LoginRequestBody(
        email: emilController.text, password: passwordController.text));

    if (response is Success<UserCredential>) {
      if (response.data.user!.emailVerified) {
        emit(LoginSuccess(data: response.data.user.toString()));
      } else {
        emit(LoginFailure(
            error: FirebaseErrorModel(
                message:
                    "تم إرسال رابط تفعيل إلى بريدك الإلكتروني. يرجى التحقق لتفعيل الحساب")));
      }
    }
    if (response is Failure<UserCredential>) {
      emit(LoginFailure(
          error: FirebaseErrorModel(message: response.error.toString())));
    }
  }

  forgotThepassword() async {
    if (emilController.text.isEmpty) {
      emit(LoginForgotthepassword(
          error:
              "الرجاء كتابةالبريدالاكتروني ثم قم forgot the password بضعط على"));
      return;
    }
    emit(LoginLoadingForgotThepassword());

    final response = await _loginRepo.forgotThepassword(
        LoginRequestBody(email: emilController.text.toString()));
    if (response is Success<String>) {
      emit(LoginSuccessForgotThepassword(
          successforgotThepassword:
              " لقد تم ارسال لينك لاعادة تعين كلمة المرور الى بريدك الاكتروني الرجاء الذهب الى البريد والضغط على اللينك"));
    } else if (response is Failure<String>) {
      emit(LoginFailureForgotThepassword(
          failureforgotThepassword:
              FirebaseErrorModel(message: response.error.toString())));
    }
  }

  signInWithGoogle() async {
    emit(LoginLoadingSignInWithGoogle());

    final response = await _loginRepo.signInWithGoogle();

    if (response is Success<String>) {
      emit(LoginSuccessSignInWithGoogle(
          isSignInGoogle: response.data.toString()));
    } else if (response is Failure<String>) {
      emit(LoginFailureSignInWithGoogle(
          error: FirebaseErrorModel(message: response.error.toString())));
    }
  }

  signInWithGoogleDelete() async {
    emit(LoginLoadingSignInWithGoogleDelete());
    final response = await _loginRepo.signInWithGoogleDelete();

    if (response is Success<GoogleSignInAccount>) {
      emit(LoginSuccessSignInWithGoogleDelete());
    } else if (response is Failure<GoogleSignInAccount>) {
      emit(LoginFailureSignInWithGoogleDelete());
    }
  }

  loginWithFacebook() async {
    //

    emit(LoginLoadingWithFacebook());
    final response = await _loginRepo.loginWithFacebook();
    if (response is Success<String>) {
      emit(LoginSuccessWithFacebook());
    } else if (response is Failure<String>) {
      // log(response.)
      emit(LoginFailureWithFacebook(
          error: FirebaseErrorModel(message: response.error.toString())));
    }
  }
}
