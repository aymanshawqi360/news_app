import 'package:news_app/core/notworking/api_result.dart';

class ApiErorrModel implements BaseErrorModel {
  @override
  String? message;

  ApiErorrModel({this.message});

  factory ApiErorrModel.fromJson(Map<String, dynamic> json) =>
      ApiErorrModel(message: json['message'] as String?);

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
