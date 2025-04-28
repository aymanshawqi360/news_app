import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/notworking/firebase_error_model.dart';

class FirebaseErrorHandler {
  static FirebaseErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
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
          case 'operation-not-allowed':
            return FirebaseErrorModel(
                error: '⚙️ تسجيل الدخول عبر هذا المزود غير مفعل.');
          case 'too-many-requests':
            return FirebaseErrorModel(
                error: '🚀 عدد محاولات تسجيل الدخول كبير جدًا. حاول لاحقًا.');
          case 'network-request-failed':
            return FirebaseErrorModel(
                error: '🌐 تأكد من اتصال الإنترنت وحاول مرة أخرى.');
          case 'invalid-credential':
            return FirebaseErrorModel(
                error: '❗ بيانات اعتماد الدخول غير صحيحة أو منتهية.');
          case 'account-exists-with-different-credential':
            return FirebaseErrorModel(
                error: '🔄 الحساب مرتبط بطريقة تسجيل دخول مختلفة.');
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
          default:
            return FirebaseErrorModel(
                error: '⚠️ حدث خطأ ما. حاول مرة أخرى لاحقًا.');
        }
      }
    }
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