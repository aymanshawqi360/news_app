import 'package:dio/dio.dart';
import 'package:news_app/core/notworking/api_constants.dart';
import 'package:news_app/features/home/data/api/home_api_constants.dart';

import 'package:news_app/features/home/data/model/home_response_model.dart';

import 'package:retrofit/retrofit.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.beasUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.topHeadlines)
  Future<HomeResponseModel> getTopHeadlines(
      @Queries() Map<String, dynamic> queries);

  @GET(HomeApiConstants.topHeadlines)
  Future<HomeResponseModel> getAllData(@Queries() Map<String, dynamic> queries);
}
