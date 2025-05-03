import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/notworking/firebase_error_model.dart';
import 'package:news_app/generated/locale_keys.g.dart';
import 'package:news_app/news_app.dart';

class FirebaseErrorHandler {
  static FirebaseErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-credential':
            return FirebaseErrorModel(
                error: LocaleKeys
                        .FirebaseAuthException_TheLoginInformationIsIncorrectOrExpired
                    .tr());
          case 'operation-not-allowed':
            return FirebaseErrorModel(
                error: LocaleKeys
                        .FirebaseAuthException_SignInWithGoogleIsNotEnabledInFirebaseSettings
                    .tr());
          case 'account-exists-with-different-credential':
            return FirebaseErrorModel(
                error: LocaleKeys
                        .FirebaseAuthException_AnAccountIsAlreadyAssociatedWithThisEmailUsingADifferentRegistrationMethod
                    .tr());
          case 'invalid-email':
            return FirebaseErrorModel(
                error: LocaleKeys.FirebaseAuthException_InvalidEmail.tr());
          case 'user-disabled':
            return FirebaseErrorModel(
                error: LocaleKeys.FirebaseAuthException_ThisUserHasBeenDisabled
                    .tr());

          case 'user-not-found':
            return FirebaseErrorModel(
                error: LocaleKeys
                        .FirebaseAuthException_ThereIsNoAccountAssociatedWithThisEmail
                    .tr());
          case 'wrong-password':
            return FirebaseErrorModel(
                error: LocaleKeys.FirebaseAuthException_IncorrectPassword.tr());
          case 'email-already-in-use':
            return FirebaseErrorModel(
                error: LocaleKeys.FirebaseAuthException_TheMailIsalreadyInUse
                    .tr());
          case 'weak-password':
            return FirebaseErrorModel(
                error:
                    LocaleKeys.FirebaseAuthException_ThePasswordIsTooWeak.tr());

          case 'too-many-requests':
            return FirebaseErrorModel(
                error: LocaleKeys
                        .FirebaseAuthException_TooManyLoginAttemptsTryAgainLater
                    .tr());
          case 'network-request-failed':
            return FirebaseErrorModel(
                error: LocaleKeys
                        .FirebaseAuthException_MakeSureYouHaveAnInternetConnectionAndTryAgain
                    .tr());

          case 'invalid-verification-code':
            return FirebaseErrorModel(
                error: LocaleKeys.FirebaseAuthException_InvalidVerificationCode
                    .tr());
          case 'invalid-verification-id':
            return FirebaseErrorModel(
                error: LocaleKeys
                        .FirebaseAuthException_InvalidIdentityVerificationCode
                    .tr());

          case 'credential-already-in-use':
            return FirebaseErrorModel(
                error: LocaleKeys.FirebaseAuthException_CredentialsAlreadyInUse
                    .tr());
          case 'requires-recent-login':
            return FirebaseErrorModel(
                error: LocaleKeys
                        .FirebaseAuthException_YouNeedToHaveRecentlyLoggedInToDoThis
                    .tr());
          case 'user-mismatch':
            return FirebaseErrorModel(
                error: LocaleKeys
                        .FirebaseAuthException_CredentialsDoNotMatchTheCurrentUser
                    .tr());
          case 'expired-action-code':
            return FirebaseErrorModel(
                error: LocaleKeys.FirebaseAuthException_ActionCodeExpired.tr());
          case 'invalid-action-code':
            return FirebaseErrorModel(
                error: LocaleKeys.FirebaseAuthException_InvalidActionCode.tr());
          case 'session-expired':
            return FirebaseErrorModel(
                error: LocaleKeys.FirebaseAuthException_SessionExpiredTryAgain
                    .tr());
          case 'missing-verification-code':
            return FirebaseErrorModel(
                error: LocaleKeys
                    .FirebaseAuthException_VerificationCodeNotEntered.tr());

          case 'internal-error':
            return FirebaseErrorModel(
                error: LocaleKeys
                        .FirebaseAuthException_AnInternalSystemErrorOccurredTryAgain
                    .tr());

          case 'sign_in_failed':
            return FirebaseErrorModel(
                error:
                    LocaleKeys.FirebaseAuthException_LoginFailedTryAgain.tr());

          default:
            return FirebaseErrorModel(
                error: LocaleKeys
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
              error: LocaleKeys
                      .PlatformException_FailedToConnectToTheServerCheckYourInternetConnection
                  .tr());
        } else if (details == '8') {
          return FirebaseErrorModel(
            error: LocaleKeys.PlatformException_ServiceNameUnknownDNSIssue.tr(),
          );
        } else if (details == '101') {
          return FirebaseErrorModel(
            error: LocaleKeys
                    .PlatformException_NetworkNotAvailableNoWiFiOrDataConnection
                .tr(),
          );
        } else if (details == '110') {
          return FirebaseErrorModel(
            error: LocaleKeys
                .PlatformException_ConnectionTimedOutServerDidNotRespond.tr(),
          );
        } else if (details == '111') {
          return FirebaseErrorModel(
            error: LocaleKeys
                    .PlatformException_TheServerRefusedTheConnectionItMayBeUnavailable
                .tr(),
          );
        } else if (details == '113') {
          return FirebaseErrorModel(
            error: LocaleKeys
                .PlatformException_NoWayToReachTheServerNetworkProblems.tr(),
          );
        } else if (details == '-2') {
          return FirebaseErrorModel(
            error:
                LocaleKeys.PlatformException_TemporaryDNSResolutionFailure.tr(),
          );
        } else if (details == 'ERROR_NETWORK_REQUEST_FAILED' || code.isEmpty) {
          return FirebaseErrorModel(
            error: LocaleKeys
                    .PlatformException_FailedToConnectToTheServerCheckYourInternetConnection
                .tr(),
          );
        }
      }
    } else if (e == 'permission_denied') {
      return FirebaseErrorModel(
        error:
            LocaleKeys.FirebaseErrorFacebook_FacebookAccountAccessDenied.tr(),
      );
    } else if (e == 'login_failed') {
      return FirebaseErrorModel(
        error: LocaleKeys
            .FirebaseErrorFacebook_FacebookLoginFailedCheckAppSettings.tr(),
      );
    } else if (e == 'app_not_set_up') {
      return FirebaseErrorModel(
        error: LocaleKeys
                .FirebaseErrorFacebook_TheAppIsNotSetUpOnTheFacebookDeveloperConsole
            .tr(),
      );
    } else if (e == 'invalid_key_hash') {
      return FirebaseErrorModel(
        error: LocaleKeys
                .FirebaseErrorFacebook_TheKeyIsIncorrectMakeSureYouAddedTheCorrectkeyHashInYourFacebookSettings
            .tr(),
      );
    } else if (e == 'access_denied') {
      return FirebaseErrorModel(
          error: LocaleKeys.FirebaseErrorFacebook_FacebookAccountAccessDenied
              .tr());
    } else {
      return FirebaseErrorModel(
        error: '💥 حدث استثناء غير معروف: ${e.toString()}',
      );
    }

    log(e.toString());
    return FirebaseErrorModel(error: "🚨 خطأ غير متوقع: ${e.toString()}");

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