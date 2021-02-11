import 'package:flutter/material.dart';
import 'package:load_image/data/model/DataModel.dart';
import 'package:load_image/pages/image_page.dart';
import 'package:load_image/data/services.dart';
import 'package:load_image/globals.dart' as globalVar;

 
class JsonParseDemo extends StatefulWidget {
  //
  JsonParseDemo() : super();
 
  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}
 
class _JsonParseDemoState extends State<JsonParseDemo> {
  //
  List<PhotoData> _data;
  bool _loading;
 
  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getFotoData().then((data) {
      setState(() {
        _data = data;
        _loading = false;
      });
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Data'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _data ? 0 : _data.length,
          itemBuilder: (context, index) {
            PhotoData data = _data[index];
            return ListTile(
              leading: Image.network(data.urls.small,
                fit: BoxFit.cover ,
                height: double.infinity,
                width: 50,
                ),
              title: Text(data.description !=null? data.description : data.altDescription), 
              subtitle: Text(data.user.name != null? data.user.name : data.user.username),
              onTap: (){
                globalVar.currentImage = data.urls.full;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DisplayImage();
              }),); 
              },
            );
          },
        ),
      ),
    );
  }




}

