import 'package:dio/dio.dart';
import 'package:news_app/core/notworking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  Dio? dio;

  DioFactory() {
    Duration time = const Duration(seconds: 30);
    dio ??
        Dio(BaseOptions(
          baseUrl: ApiConstants.beasUrl,
          connectTimeout: time,
          receiveTimeout: time,
        ));
    dio!.interceptors.add(PrettyDioLogger(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
    ));
  }
}
