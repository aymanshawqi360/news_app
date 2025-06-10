import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/notworking/dio_factory.dart';
import 'package:news_app/core/notworking/firebase_factory.dart';
import 'package:news_app/features/home/data/api/home_api_service.dart';
import 'package:news_app/features/home/data/repo/home_repo.dart';
import 'package:news_app/features/home/logic/cubit/cubit_trending/home_trending_cubit.dart';
import 'package:news_app/features/home/logic/cubit/home_news_cubit.dart';
import 'package:news_app/features/home/presentation/widget/trending/trending.dart';
import 'package:news_app/features/login/data/firebase/login_firebase_servies.dart';
import 'package:news_app/features/login/data/repo/login_firebase_repo.dart';
import 'package:news_app/features/login/logic/cubit/login_cubit.dart';
import 'package:news_app/features/sign_up/data/firebase/signup_firebase_service.dart';
import 'package:news_app/features/sign_up/data/repo/signup_firebase_repo.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:news_app/features/trending/data/api/trending_api_service.dart';
import 'package:news_app/features/trending/data/repo/trending_repo.dart';
import 'package:news_app/features/trending/logic/cubit/trending_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
//Dio
  Dio dio = DioFactory.getDio();

//FirebaseAuth && SignupFirebaseService
  FirebaseFactory firebaseFactory = FirebaseFactory();
  getIt.registerLazySingleton<FirebaseFactory>(() => firebaseFactory);

//signUp
  getIt.registerLazySingleton<SignupFirebaseService>(
      () => SignupFirebaseService(getIt()));
  getIt.registerLazySingleton<SignupFirebaseRepo>(
      () => SignupFirebaseRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

//Login
  getIt.registerLazySingleton<LoginFirebaseServies>(
      () => LoginFirebaseServies(getIt()));
  getIt.registerLazySingleton<LoginFirebaseRepo>(
      () => LoginFirebaseRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

//Home//Latest
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeNewsCubit>(() => HomeNewsCubit(getIt()));

//Home//Trending

  getIt.registerFactory<HomeTrendingCubit>(() => HomeTrendingCubit(getIt()));

//TrendingScreen
  getIt
      .registerLazySingleton<TrendingApiService>(() => TrendingApiService(dio));
  getIt.registerLazySingleton<TrendingRepo>(() => TrendingRepo(getIt()));
  getIt.registerFactory<TrendingCubit>(() => TrendingCubit(getIt()));
}
