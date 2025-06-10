import 'package:news_app/core/notworking/api_erorr_model.dart';
import 'package:news_app/core/notworking/api_error_handler.dart';

abstract class ApiResult<T> {
  const ApiResult();
  factory ApiResult.success(T data) = Success;

  factory ApiResult.failure(BaseErrorModel error) = Failure;

  when(
      {required Function(T data) onSuccess,
      required Function(BaseErrorModel data) onFailure}) {
    if (this is Success<T>) {
      return onSuccess((this as Success<T>).data);
    } else {
      return onFailure((this as Failure<T>).error);
    }
  }
}

class Success<T> extends ApiResult<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final BaseErrorModel error;
  Failure(this.error);
}

abstract class BaseErrorModel {
  String? message;
}
