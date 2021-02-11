import 'package:flutter/material.dart';
import 'package:load_image/data/get_data.dart';
import 'package:flutter/foundation.dart';
import 'package:load_image/pages/image_list.dart';
import 'data/model/photo.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: JsonParseDemo(),
    );
  }
}

