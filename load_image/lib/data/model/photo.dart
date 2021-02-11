import 'dart:convert';

import 'package:flutter/cupertino.dart';

class UserData{
  final String authorName;

  UserData({
    this.authorName
  });

  factory UserData.fromJson(Map<String,dynamic>json){
    return UserData(authorName: json['username'] as String);
  }
}

class ImageLinks{
  final String smallIcon;
  final String bigIcon;

  ImageLinks({
    this.bigIcon,
    this.smallIcon
  });

  factory ImageLinks.fromJson(Map<String,dynamic>json){
    return ImageLinks(
      smallIcon: json['small'] as String,
      bigIcon: json['full'] as String
    );
  }
}

class PhotoData{
  //final String description;
  //final String altDescription;
  //final List<UserData> userData;
  //final List<ImageLinks> imageLinks;
  final List imageLinks; 
  
  PhotoData({
   //@required this.description,
   //@required this.altDescription,
   //@required this.userData,
   @required this.imageLinks
  }); 

  factory PhotoData.fromJson(Map<String,dynamic>json){
    return PhotoData(
      imageLinks: json['urls']
      //description: json['description'] as String,
      //altDescription: json['alt_description'] as String,
      //userData: parseUserData(json, 'user'),
      //imageLinks: parseImageLinks(json, 'urls')
    );
  }

  static List<UserData> parseUserData(json,String jsonUserData){
    
    var list = json['$jsonUserData'] as List;
    List<UserData> userData = list.map((data) => UserData.fromJson(data)).toList();
    return userData;
  }

   static List<ImageLinks> parseImageLinks(json, String jsonLinks) {
    var list = json['$jsonLinks'] as List;
    List<ImageLinks> links = list.map((data) => ImageLinks.fromJson(data)).toList();
    return links;
  }

}