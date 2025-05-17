// import 'package:easy_localization/easy_localization.dart';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/notworking/api_erorr_model.dart';

import 'package:news_app/core/notworking/firebase_error_model.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class ApiErrorHandler {
  static ApiErorrModel apiErrorHandle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return ApiErorrModel(
              message: "The request was cancelled before being sent.");

        case DioExceptionType.connectionTimeout:
          return ApiErorrModel(
              message:
                  "Connection to the server timed out. Please try again later.");

        case DioExceptionType.sendTimeout:
          return ApiErorrModel(
              message: "Sending data took too long. Please try again.");

        case DioExceptionType.receiveTimeout:
          return ApiErorrModel(
              message: "The app couldn't receive data in time.");

        case DioExceptionType.badCertificate:
          return ApiErorrModel(
              message:
                  "There is a problem with the server's security certificate.");

        case DioExceptionType.badResponse:
          return erroHundle(error.response!.data['message']);

        case DioExceptionType.connectionError:
          return ApiErorrModel(
              message: "Please check your internet connection and try again.");

        case DioExceptionType.unknown:
          return ApiErorrModel(
              message: "An unexpected error occurred. Please try again");
      }
    } else {
      return ApiErorrModel(message: "Unknown error occurred");
    }
  }

  static ApiErorrModel erroHundle(dynamic data) {
    return ApiErorrModel(message: data);
  }

  static FirebaseErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-credential':
            return FirebaseErrorModel(
                message: LocaleKeys
                        .FirebaseAuthException_TheLoginInformationIsIncorrectOrExpired
                    .tr());
          case 'operation-not-allowed':
            return FirebaseErrorModel(
                message: LocaleKeys
                        .FirebaseAuthException_SignInWithGoogleIsNotEnabledInFirebaseSettings
                    .tr());
          case 'account-exists-with-different-credential':
            return FirebaseErrorModel(
                message: LocaleKeys
                        .FirebaseAuthException_AnAccountIsAlreadyAssociatedWithThisEmailUsingADifferentRegistrationMethod
                    .tr());
          case 'invalid-email':
            return FirebaseErrorModel(
                message: LocaleKeys.FirebaseAuthException_InvalidEmail.tr());
          case 'user-disabled':
            return FirebaseErrorModel(
                message: LocaleKeys
                    .FirebaseAuthException_ThisUserHasBeenDisabled.tr());

          case 'user-not-found':
            return FirebaseErrorModel(
                message: LocaleKeys
                        .FirebaseAuthException_ThereIsNoAccountAssociatedWithThisEmail
                    .tr());
          case 'wrong-password':
            return FirebaseErrorModel(
                message:
                    LocaleKeys.FirebaseAuthException_IncorrectPassword.tr());
          case 'email-already-in-use':
            return FirebaseErrorModel(
                message: LocaleKeys.FirebaseAuthException_TheMailIsalreadyInUse
                    .tr());
          case 'weak-password':
            return FirebaseErrorModel(
                message:
                    LocaleKeys.FirebaseAuthException_ThePasswordIsTooWeak.tr());

          case 'too-many-requests':
            return FirebaseErrorModel(
                message: LocaleKeys
                        .FirebaseAuthException_TooManyLoginAttemptsTryAgainLater
                    .tr());
          case 'network-request-failed':
            return FirebaseErrorModel(
                message: LocaleKeys
                        .FirebaseAuthException_MakeSureYouHaveAnInternetConnectionAndTryAgain
                    .tr());

          case 'invalid-verification-code':
            return FirebaseErrorModel(
                message: LocaleKeys
                    .FirebaseAuthException_InvalidVerificationCode.tr());
          case 'invalid-verification-id':
            return FirebaseErrorModel(
                message: LocaleKeys
                        .FirebaseAuthException_InvalidIdentityVerificationCode
                    .tr());

          case 'credential-already-in-use':
            return FirebaseErrorModel(
                message: LocaleKeys
                    .FirebaseAuthException_CredentialsAlreadyInUse.tr());
          case 'requires-recent-login':
            return FirebaseErrorModel(
                message: LocaleKeys
                        .FirebaseAuthException_YouNeedToHaveRecentlyLoggedInToDoThis
                    .tr());
          case 'user-mismatch':
            return FirebaseErrorModel(
                message: LocaleKeys
                        .FirebaseAuthException_CredentialsDoNotMatchTheCurrentUser
                    .tr());
          case 'expired-action-code':
            return FirebaseErrorModel(
                message:
                    LocaleKeys.FirebaseAuthException_ActionCodeExpired.tr());
          case 'invalid-action-code':
            return FirebaseErrorModel(
                message:
                    LocaleKeys.FirebaseAuthException_InvalidActionCode.tr());
          case 'session-expired':
            return FirebaseErrorModel(
                message: LocaleKeys.FirebaseAuthException_SessionExpiredTryAgain
                    .tr());
          case 'missing-verification-code':
            return FirebaseErrorModel(
                message: LocaleKeys
                    .FirebaseAuthException_VerificationCodeNotEntered.tr());

          case 'internal-error':
            return FirebaseErrorModel(
                message: LocaleKeys
                        .FirebaseAuthException_AnInternalSystemErrorOccurredTryAgain
                    .tr());

          case 'sign_in_failed':
            return FirebaseErrorModel(
                message:
                    LocaleKeys.FirebaseAuthException_LoginFailedTryAgain.tr());

          default:
            return FirebaseErrorModel(
                message: LocaleKeys
                        .FirebaseAuthException_SomethingWentWrongTryAgainLater
                    .tr());
        }
      } else if (e is PlatformException) {
        final code = e.code;
        final details = e.details?.toString();
        final message = e.message ?? '';
        if (code == 'network_error ' ||
            message.contains('7:') ||
            details == '7') {
          return FirebaseErrorModel(
              message: LocaleKeys
                      .PlatformException_FailedToConnectToTheServerCheckYourInternetConnection
                  .tr());
        } else if (details == '8') {
          return FirebaseErrorModel(
            message:
                LocaleKeys.PlatformException_ServiceNameUnknownDNSIssue.tr(),
          );
        } else if (details == '101') {
          return FirebaseErrorModel(
            message: LocaleKeys
                    .PlatformException_NetworkNotAvailableNoWiFiOrDataConnection
                .tr(),
          );
        } else if (details == '110') {
          return FirebaseErrorModel(
            message: LocaleKeys
                .PlatformException_ConnectionTimedOutServerDidNotRespond.tr(),
          );
        } else if (details == '111') {
          return FirebaseErrorModel(
            message: LocaleKeys
                    .PlatformException_TheServerRefusedTheConnectionItMayBeUnavailable
                .tr(),
          );
        } else if (details == '113') {
          return FirebaseErrorModel(
            message: LocaleKeys
                .PlatformException_NoWayToReachTheServerNetworkProblems.tr(),
          );
        } else if (details == '-2') {
          return FirebaseErrorModel(
            message:
                LocaleKeys.PlatformException_TemporaryDNSResolutionFailure.tr(),
          );
        } else if (details == 'ERROR_NETWORK_REQUEST_FAILED' || code.isEmpty) {
          return FirebaseErrorModel(
            message: LocaleKeys
                    .PlatformException_FailedToConnectToTheServerCheckYourInternetConnection
                .tr(),
          );
        }
      }
    } else if (e == 'permission_denied') {
      return FirebaseErrorModel(
        message:
            LocaleKeys.FirebaseErrorFacebook_FacebookAccountAccessDenied.tr(),
      );
    } else if (e == 'login_failed') {
      return FirebaseErrorModel(
        message: LocaleKeys
            .FirebaseErrorFacebook_FacebookLoginFailedCheckAppSettings.tr(),
      );
    } else if (e == 'app_not_set_up') {
      return FirebaseErrorModel(
        message: LocaleKeys
                .FirebaseErrorFacebook_TheAppIsNotSetUpOnTheFacebookDeveloperConsole
            .tr(),
      );
    } else if (e == 'invalid_key_hash') {
      return FirebaseErrorModel(
        message: LocaleKeys
                .FirebaseErrorFacebook_TheKeyIsIncorrectMakeSureYouAddedTheCorrectkeyHashInYourFacebookSettings
            .tr(),
      );
    } else if (e == 'access_denied') {
      return FirebaseErrorModel(
          message: LocaleKeys.FirebaseErrorFacebook_FacebookAccountAccessDenied
              .tr());
    } else {
      return FirebaseErrorModel(
        message: '💥 حدث استثناء غير معروف: ${e.toString()}',
      );
    }

    return FirebaseErrorModel(message: "🚨 خطأ غير متوقع: ${e.toString()}");

    // log("message-================${e.toString()}");
    // return FirebaseErrorModel(error: e.toString());
  }
}










  // if (e is FirebaseAuthException) {
      //   switch (e.code) {
      //     case 'invalid-email':
      //       return FirebaseErrorModel(error: '📧 البريد الإلكتروني غير صالح.');
      //     case 'user-disabled':
      //       return FirebaseErrorModel(error: '🚫 هذا المستخدم تم تعطيله.');
      //     case 'user-not-found':
      //       return FirebaseErrorModel(
      //           error: '❌ لا يوجد حساب مرتبط بهذا البريد.');
      //     case 'wrong-password':
      //       return FirebaseErrorModel(error: '🔑 كلمة المرور غير صحيحة.');
      //     case 'email-already-in-use':
      //       return FirebaseErrorModel(error: '📌 البريد مستخدم مسبقًا.');
      //     case 'weak-password':
      //       return FirebaseErrorModel(error: '🔐 كلمة المرور ضعيفة جدًا.');
      //     default:
      //       return FirebaseErrorModel(error: e.message ?? 'حدث خطأ غير معروف.');
      //   }
        
      // }