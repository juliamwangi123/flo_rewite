part of 'stories_bloc.dart';

class StoriesState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<StoryEntity>? stories;

  const StoriesState({
    this.isLoading,
    this.errorMessage,
    this.stories});

  StoriesState copyWith({
   bool? isLoading,
   String? errorMessage,
   List<StoryEntity>? stories
  }){
    return StoriesState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      stories: stories ?? this.stories

    );
  }
  
  @override
  List<Object?> get props => [isLoading,errorMessage,stories];
}

