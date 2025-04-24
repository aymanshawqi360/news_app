import 'package:flutter/material.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/features/login/ui/login_screen.dart';
import 'package:news_app/features/onboarding/onboarding_screen.dart';
import 'package:news_app/features/sign_up/ui/sign_up_screen.dart';

class AppRouting {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return null;
    }
  }
}
