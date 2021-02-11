import 'dart:convert';

List<PhotoData> parseJsonToPhotoData(String str) => List<PhotoData>.from(json.decode(str).map((x) => PhotoData.fromJson(x)));

class PhotoData {

    String description;
    String altDescription;
    String username;
    String name;
    String smallImage;
    String fullImage;

    PhotoData({
        this.description,
        this.altDescription,
        this.fullImage,
        this.name,
        this.smallImage,
        this.username
    });

    factory PhotoData.fromJson(Map<String, dynamic> json) => PhotoData(
        description: json["description"],
        altDescription: json["alt_description"],
        username: json['user']['username'],
        name: json['user']['name'],
        smallImage: json['urls']['small'],
        fullImage: json['urls']['full']
    );
}
