import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/notworking/firebase_error_model.dart';

class FirebaseErrorHandler {
  static FirebaseErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-credential':
            return FirebaseErrorModel(
                error: '❌ بيانات تسجيل الدخول غير صحيحة أو منتهية.');
          case 'operation-not-allowed':
            return FirebaseErrorModel(
                error:
                    '⚙️ تسجيل الدخول باستخدام Google غير مفعل في إعدادات Firebase.');
          case 'account-exists-with-different-credential':
            return FirebaseErrorModel(
                error:
                    '📌 يوجد حساب مرتبط بهذا البريد الإلكتروني باستخدام طريقة تسجيل مختلفة.');
          case 'invalid-email':
            return FirebaseErrorModel(error: '📧 البريد الإلكتروني غير صالح.');
          case 'user-disabled':
            return FirebaseErrorModel(error: '🚫 هذا المستخدم تم تعطيله.');

          case 'user-not-found':
            return FirebaseErrorModel(
                error: '❌ لا يوجد حساب مرتبط بهذا البريد.');
          case 'wrong-password':
            return FirebaseErrorModel(error: '🔑 كلمة المرور غير صحيحة.');
          case 'email-already-in-use':
            return FirebaseErrorModel(error: '📌 البريد مستخدم مسبقًا.');
          case 'weak-password':
            return FirebaseErrorModel(error: '🔐 كلمة المرور ضعيفة جدًا.');

          case 'too-many-requests':
            return FirebaseErrorModel(
                error: '🚀 عدد محاولات تسجيل الدخول كبير جدًا. حاول لاحقًا.');
          case 'network-request-failed':
            return FirebaseErrorModel(
                error: '🌐 تأكد من اتصال الإنترنت وحاول مرة أخرى.');

          case 'invalid-verification-code':
            return FirebaseErrorModel(error: '✉️ رمز التحقق غير صحيح.');
          case 'invalid-verification-id':
            return FirebaseErrorModel(
                error: '🆔 رمز التحقق من الهوية غير صالح.');

          case 'credential-already-in-use':
            return FirebaseErrorModel(
                error: '♻️ بيانات الاعتماد مستخدمة مسبقاً.');
          case 'requires-recent-login':
            return FirebaseErrorModel(
                error: '🔐 يلزم تسجيل الدخول مؤخرًا للقيام بهذه العملية.');
          case 'user-mismatch':
            return FirebaseErrorModel(
                error: '👥 بيانات الاعتماد لا تتطابق مع المستخدم الحالي.');
          case 'expired-action-code':
            return FirebaseErrorModel(error: '⏰ رمز الإجراء منتهي.');
          case 'invalid-action-code':
            return FirebaseErrorModel(error: '⚡ رمز الإجراء غير صالح.');
          case 'session-expired':
            return FirebaseErrorModel(
                error: '⌛ انتهت صلاحية الجلسة، حاول مرة أخرى.');
          case 'missing-verification-code':
            return FirebaseErrorModel(error: '📩 لم يتم إدخال رمز التحقق.');

          case 'internal-error':
            return FirebaseErrorModel(
                error: '💥 حدث خطأ داخلي في النظام. حاول مرة أخرى.');

          case 'sign_in_failed':
            return FirebaseErrorModel(
                error: '🚫 فشل تسجيل الدخول. حاول مرة أخرى.');

          default:
            return FirebaseErrorModel(
                error: '⚠️ حدث خطأ ما. حاول مرة أخرى لاحقًا.');
        }
      } else if (e is PlatformException) {
        final code = e.code;
        final details = e.details?.toString();
        final message = e.message ?? '';
        if (code == 'network_error ' ||
            message.contains('7:') ||
            details == '7') {
          return FirebaseErrorModel(
            error:
                '⚠️ لا يمكن العثور على عنوان الخادم (تحقق من اتصال الإنترنت واسم النطاق)',
          );
        } else if (details == '8') {
          return FirebaseErrorModel(
            error: '⚠️ اسم الخدمة غير معروف (مشكلة DNS)',
          );
        } else if (details == '101') {
          return FirebaseErrorModel(
            error: '🚫 الشبكة غير متاحة (لا يوجد اتصال Wi-Fi أو بيانات)',
          );
        } else if (details == '110') {
          return FirebaseErrorModel(
            error: '⏳ مهلة الاتصال انتهت (الخادم لم يستجب)',
          );
        } else if (details == '111') {
          return FirebaseErrorModel(
            error: '❌ الخادم رفض الاتصال (قد يكون غير متاح)',
          );
        } else if (details == '113') {
          return FirebaseErrorModel(
            error: '🚫 لا يوجد طريق للوصول إلى الخادم (مشاكل في الشبكة)',
          );
        } else if (details == '-2') {
          return FirebaseErrorModel(
            error: '⚠️ فشل مؤقت في تحليل اسم النطاق (DNS)',
          );
        }

        // switch (code) {
        //   case (code == 'network_error' || message.contains('7:') || details == '7'):
        //     return FirebaseErrorModel(
        //       error: '⚠️ لا يمكن العثور على عنوان الخادم (تحقق من اتصال الإنترنت واسم النطاق)',
        //     );

        //   case (details == '8'):
        //     return FirebaseErrorModel(
        //       error: '⚠️ اسم الخدمة غير معروف (مشكلة DNS)',
        //     );

        //   case (details == '101'):
        //     return FirebaseErrorModel(
        //       error: '🚫 الشبكة غير متاحة (لا يوجد اتصال Wi-Fi أو بيانات)',
        //     );

        //   case (details == '110'):
        //     return FirebaseErrorModel(
        //       error: '⏳ مهلة الاتصال انتهت (الخادم لم يستجب)',
        //     );

        //   case (details == '111'):
        //     return FirebaseErrorModel(
        //       error: '❌ الخادم رفض الاتصال (قد يكون غير متاح)',
        //     );

        //   case (details == '113'):
        //     return FirebaseErrorModel(
        //       error: '🚫 لا يوجد طريق للوصول إلى الخادم (مشاكل في الشبكة)',
        //     );

        //   case (details == '-2'):
        //     return FirebaseErrorModel(
        //       error: '⚠️ فشل مؤقت في تحليل اسم النطاق (DNS)',
        //     );

        //   default:
        //     return FirebaseErrorModel(
        //       error: '❗ خطأ غير معروف في الشبكة. رمز الخطأ: $code',
        //     );
        // }
      }
      ;

      // if (e is PlatformException) {

      //   // final error = e.osError?.errorCode;
      //   // final message = e.osError?.message ?? e.message;
      //   switch (e.details) {
      //     case '7':
      //       return FirebaseErrorModel(
      //           error:
      //               '⚠️ لا يمكن العثور على عنوان الخادم (تحقق من اسم النطاق)');

      //     case '8':
      //       return FirebaseErrorModel(
      //           error: '⚠️ اسم الخدمة غير معروف (مشكلة DNS)');

      //     case '101':
      //       return FirebaseErrorModel(
      //           error: '🚫 الشبكة غير متاحة (لا يوجد اتصال Wi-Fi أو بيانات)');

      //     case '110':
      //       return FirebaseErrorModel(
      //           error: '⏳ مهلة الاتصال انتهت (الخادم لم يستجب)');

      //     case '111':
      //       return FirebaseErrorModel(
      //           error: '❌ الخادم رفض الاتصال (قد يكون غير متاح)');

      //     case '113':
      //       return FirebaseErrorModel(
      //           error: '🚫 لا يوجد طريق للوصول إلى الخادم (مشاكل في الشبكة)');
      //     case '-2':
      //       return FirebaseErrorModel(
      //           error: '⚠️ فشل مؤقت في تحليل اسم النطاق (DNS)');
      //     case 'network_error':
      //       return FirebaseErrorModel(
      //           error: 'فشل الاتصال بالشبكة. الرجاء التحقق من الإنترنت.');

      //     default:
      //       return FirebaseErrorModel(error: '❗ خطأ في الشبكة:  (رمز الخطأ: )');
      //   }
      // }
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