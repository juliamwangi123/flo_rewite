import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:floo_aid_rewrite/core/data_types/no_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/stories/domain/entity/story_entity.dart';
import 'package:floo_aid_rewrite/features/stories/domain/usecase/story_usecase.dart';

part 'stories_event.dart';
part 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  final StoryUseCase storyUseCase;
  StoriesBloc(this.storyUseCase) : super(const StoriesState()) {
    on<GetStoriesEvent>(_handleGetStories);
  }

  void _handleGetStories(GetStoriesEvent event, Emitter<StoriesState> emmit) async{
    emmit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      stories: null
    ));

    final storiesOrFailure  = await storyUseCase(NoParams());
    storiesOrFailure.fold(
      (failure) => emmit(
        state.copyWith(
          isLoading: false,
          errorMessage: (failure as ServerFailure).message,
          stories: null
        ),
      ),
       (stories) => emmit(
        state.copyWith(
          isLoading: false,
          errorMessage: null,
          stories: stories
        ),
      ),
      );

  }
}
