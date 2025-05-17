import 'package:bloc/bloc.dart';
import 'package:news_app/core/notworking/api_erorr_model.dart';
import 'package:news_app/core/notworking/api_result.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';

import 'package:news_app/features/home/data/repo/home_repo.dart';
import 'package:news_app/features/home/logic/cubit/cubit_trending/home_trending_state.dart';

class HomeTrendingCubit extends Cubit<HomeTrendingState> {
  final HomeRepo _homeRepo;
  HomeTrendingCubit(this._homeRepo) : super(HomeTrendingInitial());

  getAllData({required int pageSize, required int page}) async {
    //  if (isClosed) return;
    emit(HomeAllDataLoading());
    final response = await _homeRepo.getAllData(pageSize: pageSize, page: page);
    if (response is Success<HomeResponseModel>) {
      //   if (isClosed) return;
      emit(HomeAllDataSuccess(allData: response.data.articles!));
    } else if (response is Failure<HomeResponseModel>) {
      //   if (isClosed) return;
      emit(HomeAllDataFailure(
          message: ApiErorrModel(message: response.error.message.toString())));
    }
  }

  getTrending() async {
    // if (isClosed) return;
    emit(HomeAllDataLoading());
    final response = await _homeRepo.getAllData(pageSize: 20, page: 1);
    if (response is Success<HomeResponseModel>) {
      //   if (isClosed) return;
      emit(HomeAllDataSuccess(allData: response.data.articles ?? []));
    } else if (response is Failure<HomeResponseModel>) {
      // if (isClosed) return;
      emit(HomeAllDataFailure(
          message: ApiErorrModel(message: response.error.message.toString())));
    }
  }
}
