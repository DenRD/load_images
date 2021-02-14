import 'package:flutter/material.dart';
import 'package:load_image/bloc/image_bloc.dart';
import 'package:load_image/data/services.dart';
import 'package:load_image/pages/image_list.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: BlocProvider(
        create: (context) => ImageBloc(ServicesImp()),
        child: ImageList(),
      ),
      //home: ImageList(),
    );
  }
}

