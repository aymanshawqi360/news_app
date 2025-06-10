import 'dart:developer';

import 'package:news_app/core/notworking/api_error_handler.dart';
import 'package:news_app/core/notworking/api_result.dart';
import 'package:news_app/features/trending/data/api/trending_api_constants.dart';
import 'package:news_app/features/trending/data/api/trending_api_service.dart';
import 'package:news_app/features/trending/data/model/trending_response_model.dart';

class TrendingRepo {
  final TrendingApiService _trendingApiService;
  TrendingRepo(this._trendingApiService);

  Future<ApiResult<TrendingResponseModel>> getAllNewsTrending(
      {required int pageSize, required int page}) async {
    try {
      final response = await _trendingApiService.getAllNewsTrending({
        'apiKey': TrendingApiConstants.apiKey,
        'pageSize': pageSize,
        'page': page,
        'q': TrendingApiConstants.q
      });
      log("Success");
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.apiErrorHandle(e));
    }
  }
}
