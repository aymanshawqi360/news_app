import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;

  static getDio() {
    Duration time = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.receiveTimeout = time
        ..options.connectTimeout = time;
      interceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static interceptors() {
    dio?.interceptors.add(PrettyDioLogger(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
    ));
  }
}
