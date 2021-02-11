import 'dart:html';

import 'package:meta/meta.dart';

class ImageModel{

  final String author;
  final String name;
  final String imageLink;

  ImageModel({
    @required this.author,
    @required this.name,
    @required this.imageLink,
  }); 

  @override
  bool operator == (Object o){
    if(identical(this, o)) return true;

    return o is ImageModel &&
        o.author == author &&
        o.name == name &&
        o.imageLink == imageLink;
  }

  @override
  int get hashCode => author.hashCode ^ name.hashCode ^ imageLink.hashCode; 
}