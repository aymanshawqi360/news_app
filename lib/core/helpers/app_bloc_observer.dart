import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('${bloc.runtimeType} تم إنشاؤه');
  }

  @override
  void onClose(BlocBase bloc) {
    log('🛑 ${bloc.runtimeType} تم إغلاقه');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('${bloc.runtimeType} تم إنشاؤه');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('🔥 ${bloc.runtimeType} خطأ: $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('📩 ${bloc.runtimeType} استلم الحدث: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('🔄 ${bloc.runtimeType}: ${transition.event} ==> ${transition.nextState}');
  }
}
