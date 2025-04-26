import 'package:news_app/core/notworking/firebase_error_model.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final FirebaseErrorModel error;

  SignUpFailure({required this.error});
}
