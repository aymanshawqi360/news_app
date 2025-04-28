import 'dart:developer';

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
      //   log(FirebaseErrorModel(error: response.error.error).toString());
      emit(SignUpFailure(
          error: FirebaseErrorModel(error: response.error.error.toString())));
    }
  }
}
