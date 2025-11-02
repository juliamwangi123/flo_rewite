import 'package:floo_aid_rewrite/features/stories/domain/entity/story_entity.dart';

class StoriesModel extends StoryEntity {
 const StoriesModel({
    required super.storyImageUrl, 
    required super.storyTitle, 
    required super.storyContent, 
    required super.readDuration, 
    required super.postedAt});


factory StoriesModel.toJson(Map<dynamic, dynamic> json){
  return StoriesModel(
    storyImageUrl: json['storyImageUrl'],
    storyTitle:  json['storyTitle'],
    storyContent: json['storyContent'],
    readDuration: json['readDuration'],
    postedAt: json['postedAt']
  );
}

  Map<String, dynamic> toJson() {
    return{
        'storyImageUrl': storyImageUrl,
        'storyTitle': storyTitle,
        'storyContent': storyContent,
        'readDuration': readDuration,
        'postedAt': postedAt
    };
  
  }

  
}