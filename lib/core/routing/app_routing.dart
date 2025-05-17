import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/di/dependency_injection.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/features/home/presentation/home_screen.dart';
import 'package:news_app/features/home/logic/cubit/cubit_trending/home_trending_cubit.dart';
import 'package:news_app/features/home/logic/cubit/home_news_cubit.dart';
import 'package:news_app/features/login/logic/cubit/login_cubit.dart';
import 'package:news_app/features/login/ui/login_screen.dart';
import 'package:news_app/features/onboarding/onboarding_screen.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:news_app/features/sign_up/ui/sign_up_screen.dart';

class AppRouting {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.signUp:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: const SignUpScreen(),
                ));
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<HomeNewsCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<HomeTrendingCubit>(),
                    ),
                  ],
                  child: const HomeScreen(),
                ));

      default:
        return null;
    }
  }
}
