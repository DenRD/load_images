import 'package:flutter/material.dart';
import 'package:load_image/globals.dart' as globalVar;

class DisplayImage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return DisplayImageState();
  }
}

class DisplayImageState extends State<DisplayImage>{
  @override
  Widget build(BuildContext context) {
    //Future.delayed(Duration(seconds: 3));
    Widget  displayImage = new Image.network(
    globalVar.currentImage,
    fit: BoxFit.scaleDown,
    height: double.infinity,
    width: double.infinity,
    alignment: Alignment.center,
  );
  return new Scaffold(
    body: displayImage
  );
  }

  

}