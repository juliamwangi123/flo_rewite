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
 const queryString = '''
*[_type == "post"] | order(date desc) {
  _id,
  title,
  "slug": slug.current,
  "url": "https://yourdomain.com/posts/" + slug.current,
  excerpt,
  date,
  "imageUrl": coverImage.asset->url,
  content,
  "plainTextContent": pt::text(content),
  author->{firstName, lastName}
}
''';

   final url = Uri.parse(
  'https://996a0vj1.api.sanity.io/v2025-10-16/data/query/production?query=${Uri.encodeComponent(queryString)}'
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