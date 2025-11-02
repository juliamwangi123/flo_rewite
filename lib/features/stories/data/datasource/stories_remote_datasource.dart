import 'dart:convert';

import 'package:floo_aid_rewrite/features/stories/data/models/stories_model.dart';
import 'package:http/http.dart' as http;

abstract class StoriesRemoteDatasource {
   Future <List<StoriesModel>> getStories();
}


class StoriesRemoteDatasourceImpl implements StoriesRemoteDatasource{
@override
Future<List<StoriesModel>> getStories() async {
  try {
    final url = Uri.parse(
      'https://996a0vj1.api.sanity.io/v2025-10-16/data/query/production?query=*%5B_type%20%3D%3D%20%22post%22%5D%20%7C%20order(date%20desc)%20%7B%20_id%2C%20title%2C%20%22slug%22%3A%20slug.current%2C%20%22url%22%3A%20%22https%3A%2F%2Fyourdomain.com%2Fposts%2F%22%20%2B%20slug.current%2C%20excerpt%2C%20date%2C%20%22imageUrl%22%3A%20coverImage.asset-%3Eurl%2C%20author-%3E%7BfirstName%2C%20lastName%7D%20%7D'
    );
    
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      
      // Extract the 'result' array from  santity response
      final List<dynamic> storiesJson = responseBody['result'];
      
       final stories = storiesJson.map((story) => StoriesModel.fromJson(story)).toList();
       return stories;

    } else {
      throw Exception('Failed to load stories: ${response.statusCode}');
    }

  } catch (e) {
    throw Exception('Unexpected error: $e');
  }
}

}