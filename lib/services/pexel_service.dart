import 'dart:convert';

import 'package:http/http.dart' as http;

class PexelsService {
  static const String _apiKey =
      'Am7UIoRFskxukLM3xewOOHKkwbTVQTEtzZ6b6YN84mnTKJlczclbFTqu';

  Future<List<String>> fetchImages(String query) async {
   final url = Uri.parse(
        'https://api.pexels.com/v1/search?query=$query&per_page=80&page=1');

    final response = await http.get(url, headers: {
      'Authorization': _apiKey,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List photos = data['photos'];

      return photos.map<String>((photo) => photo['src']['large']).toList();
    } else {
      throw Exception('Failed to load Images');
    }
  }
}
 