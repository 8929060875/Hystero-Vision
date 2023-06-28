import 'dart:convert';

import 'package:http/http.dart' as http;

class DataImage {
  static Future<List<dynamic>> fetchImage() async {
    final response = await http.get(Uri.parse('http://20.197.24.178/api/'));
    if (response.statusCode == 200) {
      var image = json.decode(response.body);
      print(response.statusCode.toString());

      return image['dataset'];
    } else {
      throw Exception('Failed to load images');
    }
  }
}
