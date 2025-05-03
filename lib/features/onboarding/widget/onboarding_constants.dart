import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class OnboardingConstants {
  static List<String> images = [
    AppAssets().onboardingScreenOne,
    AppAssets().onboardingScreenThree,
    AppAssets().onboardingScreenTwo,
  ];

  static List<String> textsOnboarding = [
    LocaleKeys.Onboarding_AllTheNewsThatMattersToYouInOnePlace,
    LocaleKeys.Onboarding_BeTheFirstToknowWithRealTimeBreakingNewsAlerts,
    LocaleKeys.Onboarding_SelectYourInterestsAndLetUsTakeCareOfTheRest,
  ];
}
