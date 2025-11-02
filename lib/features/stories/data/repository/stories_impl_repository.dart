import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/stories/data/datasource/stories_remote_datasource.dart';
import 'package:floo_aid_rewrite/features/stories/domain/entity/story_entity.dart';
import 'package:floo_aid_rewrite/features/stories/domain/repository/story_repository.dart';

class StoriesImplRepository implements StoryRepository {
  final StoriesRemoteDatasource storiesRemoteDatasource;

  StoriesImplRepository({required this.storiesRemoteDatasource});

  @override
  Future<Either<Failure, List<StoryEntity>>> getStories() async{
    try {
      final results = await storiesRemoteDatasource.getStories();
      return Right(results);
    } catch (e) {
       return Left(ServerFailure(e.toString()));
    }
 
 
  }

}