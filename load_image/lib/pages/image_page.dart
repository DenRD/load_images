import 'package:flutter/material.dart';
import 'package:load_image/globals.dart' as globalVar;

class DisplayImage extends StatefulWidget {
  DisplayImage() : super();

  @override
  State<StatefulWidget> createState() {
    return DisplayImageState();
  }
}

class DisplayImageState extends State<DisplayImage> {
  @override
  Widget build(BuildContext context) {
    Widget displayImage = new Image.network(
      globalVar.currentImage,
      fit: BoxFit.scaleDown,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    );
    return new Scaffold(body: displayImage);
  }
}
