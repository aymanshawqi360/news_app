import 'package:news_app/core/notworking/api_erorr_model.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';

sealed class HomeTrendingState {}

class HomeTrendingInitial extends HomeTrendingState {}

class HomeAllDataLoading extends HomeTrendingState {}

class HomeAllDataSuccess extends HomeTrendingState {
  final List<Articles> allData;

  HomeAllDataSuccess({required this.allData});
}

class HomeAllDataFailure extends HomeTrendingState {
  final ApiErorrModel message;

  HomeAllDataFailure({required this.message});
}
