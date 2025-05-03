// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "SignUp": {
    "SignupToGetStarted": "سجل للبدء",
    "AlreadyHaveAnAccount": "هل لديك حساب بالفعل؟"
  },
  "Login": {
    "dontHaveAnAccount": "ليس لديك حساب؟",
    "SignUp": "اشتراك",
    "Hello": "مرحبًا",
    "Again": "مرة أخرى!",
    "WelcomeBackYouVebeenMissed": "أهلاً بعودتك، لقد افتقدناك",
    "Email": "بريد إلكتروني",
    "Password": "كلمة المرور",
    "RememberMe": "تذكرنى",
    "ForgotThePassword": "نسيت كلمة المرور؟",
    "Login": "تسجيل الدخول",
    "OrcontinueWith": "أو الاستمرار مع",
    "Good": "حسناً",
    "InvalidEmail": "البريد الإلكتروني غير صالح"
  },
  "Onboarding": {
    "Next": "التالي",
    "Back": "خلف",
    "GetStarted": "البدء",
    "AllTheNewsThatMattersToYouInOnePlace": "كل الأخبار التي تهمك في مكان واحد.",
    "SelectYourInterestsAndLetUsTakeCareOfTheRest": "اختر اهتماماتك... ودعنا نهتم بالباقي!",
    "BeTheFirstToknowWithRealTimeBreakingNewsAlerts": "كن أول من يعرف، مع تنبيهات الأخبار العاجلة في الوقت الحقيقي."
  },
  "FirebaseAuthException": {
    "TheLoginInformationIsIncorrectOrExpired": "❌ بيانات تسجيل الدخول غير صحيحة أو منتهية.",
    "SignInWithGoogleIsNotEnabledInFirebaseSettings": "⚙️ تسجيل الدخول باستخدام Google غير مفعل في إعدادات Firebase.",
    "AnAccountIsAlreadyAssociatedWithThisEmailUsingADifferentRegistrationMethod": "📌يوجد حساب مرتبط بهذا البريد الإلكتروني باستخدام طريقة تسجيل مختلفة.",
    "InvalidEmail": "📧 البريد الإلكتروني غير صالح.",
    "ThisUserHasBeenDisabled": "🚫 هذا المستخدم تم تعطيله.",
    "ThereIsNoAccountAssociatedWithThisEmail": "❌ لا يوجد حساب مرتبط بهذا البريد.",
    "IncorrectPassword": "🔑 كلمة المرور غير صحيحة.",
    "TheMailIsalreadyInUse": " البريد مستخدم مسبقًا.",
    "ThePasswordIsTooWeak": "🔐 كلمة المرور ضعيفة جدًا.",
    "TooManyLoginAttemptsTryAgainLater": " عدد محاولات تسجيل الدخول كبير جدًا. حاول لاحقًا.",
    "MakeSureYouHaveAnInternetConnectionAndTryAgain": "🌐 تأكد من اتصال الإنترنت وحاول مرة أخرى.",
    "InvalidVerificationCode": "✉️ رمز التحقق غير صحيح.",
    "InvalidIdentityVerificationCode": "🆔 رمز التحقق من الهوية غير صالح.",
    "CredentialsAlreadyInUse": "♻️ بيانات الاعتماد مستخدمة مسبقاً.",
    "YouNeedToHaveRecentlyLoggedInToDoThis": "🔐 يلزم تسجيل الدخول مؤخرًا للقيام بهذه العملية.",
    "CredentialsDoNotMatchTheCurrentUser": "👥 بيانات الاعتماد لا تتطابق مع المستخدم الحالي.",
    "ActionCodeExpired": " رمز الإجراء منتهي.",
    "InvalidActionCode": " رمز الإجراء غير صالح.",
    "SessionExpiredTryAgain": "⌛ انتهت صلاحية الجلسة، حاول مرة أخرى.",
    "VerificationCodeNotEntered": "📩 لم يتم إدخال رمز التحقق.",
    "AnInternalSystemErrorOccurredTryAgain": "💥 حدث خطأ داخلي في النظام. حاول مرة أخرى.",
    "LoginFailedTryAgain": "🚫 فشل تسجيل الدخول. حاول مرة أخرى.",
    "SomethingWentWrongTryAgainLater": "⚠️ حدث خطأ ما. حاول مرة أخرى لاحقًا."
  },
  "PlatformException": {
    "FailedToConnectToTheServerCheckYourInternetConnection": "⚠️ فشل في الاتصال بالخادم (تحقق من الاتصال بالإنترنت)",
    "ServiceNameUnknownDNSIssue": "⚠️ اسم الخدمة غير معروف (مشكلة DNS)",
    "NetworkNotAvailableNoWiFiOrDataConnection": "🚫 الشبكة غير متاحة (لا يوجد اتصال Wi-Fi أو بيانات)",
    "ConnectionTimedOutServerDidNotRespond": "⏳ مهلة الاتصال انتهت (الخادم لم يستجب)",
    "TheServerRefusedTheConnectionItMayBeUnavailable": "❌ الخادم رفض الاتصال (قد يكون غير متاح)",
    "NoWayToReachTheServerNetworkProblems": "🚫 لا يوجد طريق للوصول إلى الخادم (مشاكل في الشبكة)",
    "TemporaryDNSResolutionFailure": "⚠️ فشل مؤقت في تحليل اسم النطاق (DNS)"
  },
  "FirebaseErrorFacebook": {
    "FacebookAccountAccessPermissionDenied": "❌ تم رفض إذن الوصول إلى حساب Facebook",
    "FacebookLoginFailedCheckAppSettings": "🚫 فشل تسجيل الدخول عبر Facebook (تحقق من إعدادات التطبيق)",
    "TheAppIsNotSetUpOnTheFacebookDeveloperConsole": "⚠️ لم يتم إعداد التطبيق على Facebook Developer Console",
    "TheKeyIsIncorrectMakeSureYouAddedTheCorrectkeyHashInYourFacebookSettings": "❌ المفتاح غير صحيح (تأكد من إضافة key hash الصحيح في إعدادات Facebook)",
    "FacebookAccountAccessDenied": "🚫 تم رفض الوصول إلى حساب Facebook"
  }
};
static const Map<String,dynamic> _en = {
  "SignUp": {
    "SignupToGetStarted": "Signup to get Started",
    "AlreadyHaveAnAccount": "Already have an account ?"
  },
  "Login": {
    "dontHaveAnAccount": "don’t have an account ? ",
    "SignUp": "Sign Up",
    "Hello": "Hello",
    "Again": "Again!",
    "WelcomeBackYouVebeenMissed": "Welcome back you’ve\nbeen missed",
    "Email": "Email",
    "Password": "Password",
    "RememberMe": "Remember me",
    "ForgotThePassword": "Forgot the password ?",
    "Login": "Login",
    "OrcontinueWith": "or continue with",
    "Good": "Good",
    "InvalidEmail": "Invalid email."
  },
  "Onboarding": {
    "Next": "Next",
    "Back": "Back",
    "GetStarted": "Get Started",
    "AllTheNewsThatMattersToYouInOnePlace": "All the news that matters to you in one place.",
    "SelectYourInterestsAndLetUsTakeCareOfTheRest": "Choose your interests... and let us take care of the rest!",
    "BeTheFirstToknowWithRealTimeBreakingNewsAlerts": "Be the first to know, with real-time breaking news alerts."
  },
  "FirebaseAuthException": {
    "TheLoginInformationIsIncorrectOrExpired": "❌ The login information is incorrect or expired.",
    "SignInWithGoogleIsNotEnabledInFirebaseSettings": "⚙️ Sign in with Google is not enabled in Firebase settings.",
    "AnAccountIsAlreadyAssociatedWithThisEmailUsingADifferentRegistrationMethod": "📌 An account is already associated with this email using a different registration method.",
    "InvalidEmail": "📧Invalid email.",
    "ThisUserHasBeenDisabled": "🚫 This user has been disabled.",
    "ThereIsNoAccountAssociatedWithThisEmail": "❌ There is no account associated with this email.",
    "IncorrectPassword": "🔑 Incorrect password.",
    "TheMailIsalreadyInUse": " The mail is already in use.",
    "ThePasswordIsTooWeak": "🔐 The password is too weak.",
    "TooManyLoginAttemptsTryAgainLater": " Too many login attempts. Try again later.",
    "MakeSureYouHaveAnInternetConnectionAndTryAgain": "🌐 Make sure you have an internet connection and try again.",
    "InvalidVerificationCode": "✉️ Invalid verification code.",
    "InvalidIdentityVerificationCode": "🆔 Invalid identity verification code.",
    "CredentialsAlreadyInUse": "♻️ Credentials already in use.",
    "YouNeedToHaveRecentlyLoggedInToDoThis": "🔐 You need to have recently logged in to do this.",
    "CredentialsDoNotMatchTheCurrentUser": "👥 Credentials do not match the current user.",
    "ActionCodeExpired": " Action code expired.",
    "InvalidActionCode": " Invalid action code.",
    "SessionExpiredTryAgain": "⌛ Session expired, try again.",
    "VerificationCodeNotEntered": "📩 Verification code not entered.",
    "AnInternalSystemErrorOccurredTryAgain": "💥 An internal system error occurred. Try again.",
    "LoginFailedTryAgain": "🚫 Login failed. Try again.",
    "SomethingWentWrongTryAgainLater": "⚠️ Something went wrong. Try again later."
  },
  "PlatformException": {
    "FailedToConnectToTheServerCheckYourInternetConnection": " Failed to connect to the server (check your internet connection)",
    "ServiceNameUnknownDNSIssue": " Service name unknown (DNS issue)",
    "NetworkNotAvailableNoWiFiOrDataConnection": " Network not available (No Wi-Fi or data connection)",
    "ConnectionTimedOutServerDidNotRespond": " Connection timed out (server did not respond)",
    "TheServerRefusedTheConnectionItMayBeUnavailable": " The server refused the connection (it may be unavailable)",
    "NoWayToReachTheServerNetworkProblems": " No way to reach the server (network problems)",
    "TemporaryDNSResolutionFailure": " Temporary DNS resolution failure"
  },
  "FirebaseErrorFacebook": {
    "FacebookAccountAccessPermissionDenied": "❌ Facebook account access permission denied",
    "FacebookLoginFailedCheckAppSettings": "🚫 Facebook login failed (check app settings)",
    "TheAppIsNotSetUpOnTheFacebookDeveloperConsole": "⚠️ The app is not set up on the Facebook Developer Console.",
    "TheKeyIsIncorrectMakeSureYouAddedTheCorrectkeyHashInYourFacebookSettings": "❌ The key is incorrect (make sure you added the correct key hash in your Facebook settings)",
    "FacebookAccountAccessDenied": "🚫 Facebook account access denied"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
