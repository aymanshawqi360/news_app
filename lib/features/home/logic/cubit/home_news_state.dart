import 'package:news_app/core/notworking/api_erorr_model.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';

sealed class HomeNewsState {}

class HomeNewsInitial extends HomeNewsState {}

class HomeNewsLoading extends HomeNewsState {}

class HomeNewsSuccess extends HomeNewsState {
  final List<Articles> listNews;

  HomeNewsSuccess({required this.listNews});
}

class HomeNewsFailure extends HomeNewsState {
  final ApiErorrModel message;

  HomeNewsFailure({required this.message});
}
