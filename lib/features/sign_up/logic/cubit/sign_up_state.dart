import 'package:news_app/core/notworking/firebase_error_model.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final FirebaseErrorModel error;

  SignUpFailure({required this.error});
}

//SignUpWithGoogle
class SignUpWithGoogleLoading extends SignUpState {}

class SignUpWithGoogleSuccess extends SignUpState {
  final String? successFull;

  SignUpWithGoogleSuccess({required this.successFull});
}

class SignUpWithGoogleFailure extends SignUpState {
  final FirebaseErrorModel? error;

  SignUpWithGoogleFailure({required this.error});
}

//loginWithFacebook

class SignUpSuccessWithFacebook extends SignUpState {}

class SignUpLoadingWithFacebook extends SignUpState {}

class SignUpFailureWithFacebook extends SignUpState {
  final FirebaseErrorModel? error;

  SignUpFailureWithFacebook({required this.error});
}
