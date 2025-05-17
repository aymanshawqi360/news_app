import 'package:json_annotation/json_annotation.dart';
part 'home_response_model.g.dart';

@JsonSerializable()
class HomeResponseModel {
  List<Articles>? articles;
  HomeResponseModel({this.articles});

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeResponseModelToJson(this);
}

@JsonSerializable()
class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;
  DateTime? publishedAt;
  Articles(
      {this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.source,
      this.title,
      this.url,
      this.urlToImage});

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

@JsonSerializable()
class Source {
  String? id;
  String? name;
  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> json() => _$SourceToJson(this);
}
