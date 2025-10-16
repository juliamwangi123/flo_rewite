import 'package:equatable/equatable.dart';

class StoryEntity extends Equatable{
  final String storyImageUrl;
  final String storyTitle;
  final String storyContent;
  final String postedAt;
  final String readDuration;

  const StoryEntity({
    required this.storyImageUrl,
    required this.storyTitle,
    required this.storyContent,
    required this.readDuration,
    required this.postedAt

  });


StoryEntity copyWith({
   String? storyImageUrl,
   String? storyTitle,
   String? storyContent,
   String?postedAt,
   String? readDuration,

}){
  return StoryEntity(
    postedAt: postedAt ?? this.postedAt,
    storyImageUrl: storyImageUrl ?? this.storyImageUrl,
    storyContent: storyContent ?? this.storyContent,
    storyTitle:  storyTitle ?? this.storyTitle,
    readDuration:  readDuration ?? this.readDuration
     );
}
  @override
  List<Object?> get props => [storyImageUrl,storyTitle,storyContent,postedAt,readDuration ];

}