import 'package:news_app/core/notworking/firebase_error_model.dart';

abstract class ApiResult<T> {
  const ApiResult();
  factory ApiResult.success(T data) = Success;
  factory ApiResult.failure(FirebaseErrorModel error) = Failure;
}

class Success<T> extends ApiResult<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final FirebaseErrorModel error;
  Failure(this.error);
}
