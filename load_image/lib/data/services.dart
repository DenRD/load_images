import 'package:http/http.dart' as http;
import 'model/DataModel.dart';
 
class Services {
  
  static const String url = 'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';
 
  static Future<List<PhotoData>> getFotoData() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<PhotoData> data = photoDataFromJson(response.body);
        return data;
      } else {
        return List<PhotoData>();
      }
    } catch (e) {
      return List<PhotoData>();
    }
  }
}