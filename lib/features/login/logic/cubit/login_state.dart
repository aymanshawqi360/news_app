import 'package:news_app/core/notworking/firebase_error_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String data;

  LoginSuccess({required this.data});
}

class LoginFailure extends LoginState {
  final FirebaseErrorModel error;
  LoginFailure({required this.error});
}

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

class LoginSSSSSS extends LoginState {
  final String error;

  LoginSSSSSS({required this.error});
}
