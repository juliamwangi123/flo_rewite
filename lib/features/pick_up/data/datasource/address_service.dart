import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class AddressService {
  Future<Either<Failure, List>> getAddressSuggestions(String query);
}

class AddressServiceImpl implements AddressService {
  @override
  Future<Either<Failure, List>> getAddressSuggestions(String query) async {
    try {
      final encodedQuery = Uri.encodeComponent(query);
      final url = Uri.parse(
        'https://photon.komoot.io/api/?q=$encodedQuery&limit=10',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> features = data['features'] ?? [];
        
        final suggestions = features
            .map((item) => item['properties']['name'] ?? item['properties']['street'] ?? 'Unknown')
            .toList();
            
        return Right(suggestions);
      } else {
        return Left(
          ServerFailure(
             'Failed with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      return Left(
        ServerFailure('Exception occurred: $e'),
      );
    }
  }
}