import 'package:get_it/get_it.dart';
import 'package:news_app/core/notworking/firebase_factory.dart';
import 'package:news_app/features/sign_up/data/api/signup_firebase_service.dart';
import 'package:news_app/features/sign_up/data/repo/signup_firebase_repo.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  FirebaseFactory firebaseFactory = FirebaseFactory();
  getIt.registerLazySingleton<FirebaseFactory>(() => firebaseFactory);

//signUp
  getIt.registerLazySingleton<SignupFirebaseService>(
      () => SignupFirebaseService(getIt()));
  getIt.registerLazySingleton<SignupFirebaseRepo>(
      () => SignupFirebaseRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
