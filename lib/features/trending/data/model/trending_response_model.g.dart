// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingResponseModel _$TrendingResponseModelFromJson(
        Map<String, dynamic> json) =>
    TrendingResponseModel(
      article: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$TrendingResponseModelToJson(
        TrendingResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'articles': instance.article,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      author: json['author'] as String?,
      content: json['content'] as String?,
      description: json['description'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      title: json['title'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
      'publishedAt': instance.publishedAt?.toIso8601String(),
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
