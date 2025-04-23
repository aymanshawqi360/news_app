class AppAssets {
  AppAssets._();
  static final AppAssets _instance = AppAssets._();
  factory AppAssets() => _instance;
  String onboardingScreenOne = "assets/images/onboarding_screen_one.png";
  String onboardingScreenTwo = "assets/images/onboarding_screen_two.png";
  String onboardingScreenThree = "assets/images/onboarding_screen_three.png";
   
}
List<String> images = [
    AppAssets().onboardingScreenOne,
    AppAssets().onboardingScreenThree,
    AppAssets().onboardingScreenTwo,
  ];