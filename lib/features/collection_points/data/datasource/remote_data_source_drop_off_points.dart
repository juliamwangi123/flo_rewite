import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/collection_points/data/models/drop_off_points_model.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class RemoteDataSourceDropOffPoints {
  Future<List<DropOffPointsModel>> getNearbyDropOffPoints();
}

class RemoteDataSourceDropOffPointsImpl implements RemoteDataSourceDropOffPoints {
  final FirebaseDatabase firebaseDatabase;

  RemoteDataSourceDropOffPointsImpl({required this.firebaseDatabase});

  @override
  Future<List<DropOffPointsModel>> getNearbyDropOffPoints() async {
    try {
      DatabaseReference ref = firebaseDatabase.ref('dropoff_locations');
      DataSnapshot snapshot = await ref.get();
      if (snapshot.value != null) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        final points = data.values
            .map((e) {
              return DropOffPointsModel.fromJson(e as Map<dynamic, dynamic>); 
            })
            .toList();
            
        return points;
      } else {
        return [];
      }
    } catch (e) {
      throw ServerFailure('Unexpected error: ${e.toString()}');
    }
  }

 
}