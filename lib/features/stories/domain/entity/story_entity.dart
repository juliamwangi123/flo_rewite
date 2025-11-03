import 'package:equatable/equatable.dart';

class StoryEntity extends Equatable{
  final String id;
  final String? author;
  final DateTime date;
  final String excerpt;
  final String imageUrl;
  final String slug;
  final String title;
  final String url;
  final dynamic content; 
  final String? plainTextContent; 

  const StoryEntity({
    required this.id,
    this.author,
    required this.date,
    required this.excerpt,
    required this.imageUrl,
    required this.slug,
    required this.title,
    required this.url,
    this.content,
    this.plainTextContent,

  });


  StoryEntity copyWith({
    String? id,
    String? author,
    DateTime? date,
    String? excerpt,
    String? imageUrl,
    String? slug,
    String? title,
    String? url,
    dynamic content,
    String? plainTextContent,
  }){
    return StoryEntity(
      id: id ?? this.id,
      author: author ?? this.author,
      date: date ?? this.date,
      excerpt: excerpt ?? this.excerpt,
      imageUrl: imageUrl ?? this.imageUrl,
      slug: slug ?? this.slug,
      title: title ?? this.title,
      url: url ?? this.url,
      content: content ?? this.content,
      plainTextContent: plainTextContent ?? this.plainTextContent,
    );
  }

  @override
  List<Object?> get props => [id, author, date, excerpt, imageUrl, slug, title, url, content, plainTextContent];

}