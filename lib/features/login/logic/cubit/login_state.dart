import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/notworking/firebase_error_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

///Login
class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String data;

  LoginSuccess({required this.data});
}

class LoginFailure extends LoginState {
  final FirebaseErrorModel error;
  LoginFailure({required this.error});
}

///ForgotThepassword
class LoginSuccessForgotThepassword extends LoginState {
  final String successforgotThepassword;

  LoginSuccessForgotThepassword({required this.successforgotThepassword});
}

class LoginFailureForgotThepassword extends LoginState {
  final FirebaseErrorModel failureforgotThepassword;

  LoginFailureForgotThepassword({required this.failureforgotThepassword});
}

class LoginLoadingForgotThepassword extends LoginState {
  // final String errorPassword;

  // LoginLoadingForgotThepassword({required this.errorPassword});
}

class LoginForgotthepassword extends LoginState {
  final String error;

  LoginForgotthepassword({required this.error});
}

///SignInWithGoogle
class LoginLoadingSignInWithGoogle extends LoginState {}

class LoginSuccessSignInWithGoogle extends LoginState {
  final dynamic isSignInGoogle;

  LoginSuccessSignInWithGoogle({required this.isSignInGoogle});
}

class LoginFailureSignInWithGoogle extends LoginState {
  final FirebaseErrorModel? error;

  LoginFailureSignInWithGoogle({required this.error});
}

///signInWithGoogleDelete
class LoginLoadingSignInWithGoogleDelete extends LoginState {}

class LoginSuccessSignInWithGoogleDelete extends LoginState {}

class LoginFailureSignInWithGoogleDelete extends LoginState {}

//loginWithFacebook
//
class LoginSuccessWithFacebook extends LoginState {}

class LoginLoadingWithFacebook extends LoginState {}

class LoginFailureWithFacebook extends LoginState {
  final FirebaseErrorModel? error;

  LoginFailureWithFacebook({required this.error});
}
