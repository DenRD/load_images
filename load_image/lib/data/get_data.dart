
import 'dart:convert';
import 'model/photo.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class GetData{
  
  List<PhotoData> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<PhotoData>((json) => PhotoData.fromJson(json)).toList();
}

Future<List<PhotoData>> fetchPhotos(http.Client client) async {
  final response = await client.get('https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');

  return parsePhotos(response.body);
  }
}