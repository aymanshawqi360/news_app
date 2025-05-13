import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/notworking/firebase_factory.dart';
import 'package:news_app/core/routing/app_routing.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/core/theming/colors.dart';

class NewsApp extends StatelessWidget {
  final AppRouting appRouting;
  const NewsApp({super.key, required this.appRouting});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsManager.primarywhiteColor,
          appBarTheme:
              AppBarTheme(backgroundColor: ColorsManager.primarywhiteColor),
        ),
        initialRoute: (FirebaseFactory().firebaseAuth!.currentUser != null &&
                FirebaseFactory().firebaseAuth!.currentUser!.emailVerified)
            ? Routes.home
            : Routes.onboarding,
        onGenerateRoute: appRouting.generateRoute,
      ),
    );
  }
}
