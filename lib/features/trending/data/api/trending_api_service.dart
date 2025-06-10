import 'package:dio/dio.dart';
import 'package:news_app/core/notworking/api_constants.dart';
import 'package:news_app/features/trending/data/api/trending_api_constants.dart';
import 'package:news_app/features/trending/data/model/trending_response_model.dart';
import 'package:retrofit/retrofit.dart';
part 'trending_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.beasUrl)
abstract class TrendingApiService {
  factory TrendingApiService(Dio dio, {String? baseUrl}) = _TrendingApiService;

  @GET(TrendingApiConstants.topHeadlines)
  Future<TrendingResponseModel> getAllNewsTrending(
      @Queries() Map<String, dynamic> allQueries);
}
