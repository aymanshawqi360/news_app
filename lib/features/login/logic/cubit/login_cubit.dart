import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                error:
                    "تم إرسال رابط تفعيل إلى بريدك الإلكتروني. يرجى التحقق لتفعيل الحساب")));
      }
    }
    if (response is Failure<UserCredential>) {
      emit(
          LoginFailure(error: FirebaseErrorModel(error: response.error.error)));
    }
  }

  forgotThepassword() async {
    if (emilController.text.isEmpty) {
      emit(LoginSSSSSS(
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
              FirebaseErrorModel(error: response.error.error.toString())));
    }
  }
}
