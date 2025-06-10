import 'package:news_app/core/notworking/api_erorr_model.dart';
import 'package:news_app/features/trending/data/model/trending_response_model.dart';

sealed class TrendingState {}

class TrendingInitial extends TrendingState {}

class TrendingSuccess extends TrendingState {
  final List<Article> listNews;
  // final String? status;
  final bool hasReachedEnd;

  TrendingSuccess({required this.listNews, required this.hasReachedEnd});
}

class TrendingLoading extends TrendingState {
  final int listLoadinglength;
  TrendingLoading({required this.listLoadinglength});
}

class TrendingFailure extends TrendingState {
  final ApiErorrModel message;

  TrendingFailure({required this.message});
}

class IsError extends TrendingState {}

class IsTrending extends TrendingState {}

class Is extends TrendingState {}
