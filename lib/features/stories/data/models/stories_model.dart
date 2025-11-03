import 'package:floo_aid_rewrite/features/stories/domain/entity/story_entity.dart';

class StoriesModel extends StoryEntity {
  const StoriesModel({
    required super.id,
    super.author,
    required super.date,
    required super.excerpt,
    required super.imageUrl,
    required super.slug,
    required super.title,
    required super.url,
    super.content,
    super.plainTextContent,
  });

  factory StoriesModel.fromJson(Map<String, dynamic> json) {
    // Handle author - it could be null or an object
    String? authorName;
    if (json['author'] != null && json['author'] is Map) {
      final authorData = json['author'] as Map<String, dynamic>;
      final firstName = authorData['firstName'] ?? '';
      final lastName = authorData['lastName'] ?? '';
      authorName = '$firstName $lastName'.trim();
      if (authorName.isEmpty) authorName = null;
    }

    return StoriesModel(
      id: json['_id'] as String,
      author: authorName,
      date: DateTime.parse(json['date'] as String),
      excerpt: json['excerpt'] as String,
      imageUrl: json['imageUrl'] as String,
      slug: json['slug'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      content: json['content'],
      plainTextContent: json['plainTextContent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'author': author,
      'date': date.toIso8601String(),
      'excerpt': excerpt,
      'imageUrl': imageUrl,
      'slug': slug,
      'title': title,
      'url': url,
      'content': content,
      'plainTextContent': plainTextContent,
    };
  }
}