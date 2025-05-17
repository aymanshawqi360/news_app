import 'package:bloc/bloc.dart';
import 'package:news_app/core/notworking/api_erorr_model.dart';
import 'package:news_app/core/notworking/api_result.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';
import 'package:news_app/features/home/data/repo/home_repo.dart';
import 'package:news_app/features/home/logic/cubit/home_news_state.dart';

class HomeNewsCubit extends Cubit<HomeNewsState> {
  final HomeRepo _homeRepo;
  HomeNewsCubit(this._homeRepo) : super(HomeNewsInitial());
  List<Articles> ccc = [];
  getLatestNews({required String category}) async {
    emit(HomeNewsLoading());
    final response = await _homeRepo.getLatestNews(category: category);

    if (response is Success<HomeResponseModel>) {
      emit(HomeNewsSuccess(listNews: response.data.articles!));
    } else if (response is Failure<HomeResponseModel>) {
      emit(HomeNewsFailure(
          message: ApiErorrModel(message: response.error.message.toString())));
    }
  }

  getLatestSports() async {
    emit(HomeNewsLoading());
    final response = await _homeRepo.getLatestNews(category: "Sports");

    if (response is Success<HomeResponseModel>) {
      ccc = response.data.articles!;
      emit(HomeNewsSuccess(listNews: ccc));
    } else if (response is Failure<HomeResponseModel>) {
      emit(HomeNewsFailure(
          message: ApiErorrModel(message: response.error.message.toString())));
    }
  }
}
