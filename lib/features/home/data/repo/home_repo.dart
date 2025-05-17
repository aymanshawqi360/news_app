import 'package:news_app/core/notworking/api_error_handler.dart';

import 'package:news_app/core/notworking/api_result.dart';
import 'package:news_app/features/home/data/api/home_api_constants.dart';
import 'package:news_app/features/home/data/api/home_api_service.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  HomeRepo(this._homeApiService);

  Future<ApiResult<HomeResponseModel>> getLatestNews(
      {required String category}) async {
    try {
      final response = await _homeApiService.getTopHeadlines({
        'apiKey': HomeApiConstants.apiKey,
        'language': 'en',
        'category': category,
      });
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.apiErrorHandle(e));
    }
  }

  Future<ApiResult<HomeResponseModel>> getAllData(
      {required int pageSize, required int page}) async {
    try {
      final response = await _homeApiService.getAllData({
        'apiKey': HomeApiConstants.apiKey,
        'q': HomeApiConstants.q,
        'pageSize': pageSize,
        'page': page,
      });

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.apiErrorHandle(e));
    }
  }
}
