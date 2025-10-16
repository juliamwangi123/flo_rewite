import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/no_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/stories/domain/entity/story_entity.dart';
import 'package:floo_aid_rewrite/features/stories/domain/repository/story_repository.dart';

class StoryUseCase implements UseCase<StoryEntity, NoParams>{
  final StoryRepository storyRepository;
  StoryUseCase({required this.storyRepository});


  @override
  Future<Either<Failure, StoryEntity>> call(NoParams params) async{
    return storyRepository.getStories();
  
  }

}