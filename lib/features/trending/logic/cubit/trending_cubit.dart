import 'dart:developer';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:news_app/core/notworking/api_erorr_model.dart';
import 'package:news_app/features/trending/data/model/trending_response_model.dart';
import 'package:news_app/features/trending/data/repo/trending_repo.dart';
import 'package:news_app/features/trending/logic/cubit/trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  final TrendingRepo _trendingRepo;
  TrendingCubit(this._trendingRepo) : super(TrendingInitial());
  int page = 1;
  int pageSize = 20;
  // bool hasMore = false;
  bool hasReachedEnd = false;
  // bool isLoading = false;
  // List<Articles>? articles;
  List<Article> news = [];
  //List<Article> listLoading = [];

  int statusUi = 0;
  getAllNewsTrending({bool isRefrash = false}) async {
    if (!isRefrash) {
      emit(TrendingLoading(listLoadinglength: pageSize));
    }

    final response =
        await _trendingRepo.getAllNewsTrending(pageSize: pageSize, page: page);

    response.when(onSuccess: (success) {
      if (success.article!.isNotEmpty) {
        page++;

        // listLoading = success.article!;
        news.addAll(success.article!);
        log("isNotEmpty");
        emit(TrendingSuccess(listNews: news, hasReachedEnd: false));
      }
    }, onFailure: (failure) {
      // if (isRefrash) {
      hasReachedEnd = true;
      emit(TrendingFailure(
          message: ApiErorrModel(message: failure.message.toString())));
      // await Future.delayed(const Duration(seconds: 2));
      // emit(Is());
      //  emit(TrendingSuccess(listNews: news, hasReachedEnd: true));
      log("isEmpty");
    });
  }
}
