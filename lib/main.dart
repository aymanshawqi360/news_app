import 'package:flutter/material.dart';
import 'package:news_app/core/di/dependency_injection.dart';
import 'package:news_app/core/routing/app_routing.dart';
import 'package:news_app/news_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(NewsApp(appRouting: AppRouting()));
}
