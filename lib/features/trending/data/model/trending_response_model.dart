import 'package:json_annotation/json_annotation.dart';

part 'trending_response_model.g.dart';

@JsonSerializable()
class TrendingResponseModel {
  String? status;
  @JsonKey(name: "articles")
  List<Article>? article;
  TrendingResponseModel({this.article, this.status});

  factory TrendingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$TrendingResponseModelToJson(this);
}

@JsonSerializable()
class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;
  DateTime? publishedAt;
  Article(
      {this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.source,
      this.title,
      this.url,
      this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class Source {
  String? id;
  String? name;
  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> json() => _$SourceToJson(this);
}
