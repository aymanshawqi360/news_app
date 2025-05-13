import 'package:news_app/core/notworking/api_result.dart';

class FirebaseErrorModel implements BaseErrorModel {
  @override
  String? message;
  FirebaseErrorModel({this.message});
}
