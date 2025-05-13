abstract class ApiResult<T> {
  const ApiResult();
  factory ApiResult.success(T data) = Success;

  factory ApiResult.failure(BaseErrorModel error) = Failure;
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
