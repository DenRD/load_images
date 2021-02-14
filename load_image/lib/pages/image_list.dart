import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:load_image/data/model/dataModel.dart';
import 'package:load_image/pages/image_page.dart';
import 'package:load_image/bloc/image_bloc.dart';
import 'package:load_image/globals.dart' as globalVar;

class ImageList extends StatefulWidget {
  ImageList() : super();

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  ImageBloc imageBloc;

  @override
  void initState() {
    super.initState();
    imageBloc = BlocProvider.of<ImageBloc>(context);
    imageBloc.add(GetPhotoData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DATA'),
      ),
      body: Container(
        color: Colors.white,
        child: BlocConsumer<ImageBloc, ImageState>(
          listener: (context, state) {
            if (state is PhotoError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          // ignore: missing_return
          builder: (context, state) {
            if (state is ImageInitial) {
              return buildLoading();
            } else if (state is ImageLoading) {
              return buildLoading();
            } else if (state is ImageLoaded) {
              return builList(state.photo);
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget builList(List<PhotoData> pData) {
    return ListView.builder(
      itemCount: null == pData ? 0 : pData.length,
      itemBuilder: (context, index) {
        PhotoData data = pData[index];
        return ListTile(
          leading: Image.network(
            data.smallImage,
            fit: BoxFit.cover,
            height: double.infinity,
            width: 50,
          ),
          title: Text(data.description != null
              ? data.description
              : data.altDescription),
          subtitle: Text(data.name != null ? data.name : data.username),
          onTap: () {
            globalVar.currentImage = data.fullImage;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DisplayImage();
              }),
            );
          },
        );
      },
    );
  }
}
