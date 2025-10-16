import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/stories/domain/entity/story_entity.dart';

abstract class StoryRepository {
  Future<Either<Failure,StoryEntity>> getStories();
}