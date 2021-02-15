import 'package:http/http.dart' as http;
import 'model/dataModel.dart';

abstract class Services{
  Future<List<PhotoData>> getPhotoData();
}

class ServicesImp implements Services {
  static const String url =
      'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';

  @override
  Future<List<PhotoData>> getPhotoData()async{
    try {
      final response = await http.get(url);
      return 200 == response.statusCode
          ? parseJsonToPhotoData(response.body)
          : List<PhotoData>();
    } catch (e) {
      throw Exception();
    }
  }
}
