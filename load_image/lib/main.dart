import 'package:flutter/material.dart';
import 'package:load_image/pages/image_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: ImageList(),
    );
  }
}

