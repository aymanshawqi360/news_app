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
          default:
            return FirebaseErrorModel(error: e.message ?? 'حدث خطأ غير معروف.');
        }
      }
    }
    return FirebaseErrorModel(error: e.toString());
  }
}
