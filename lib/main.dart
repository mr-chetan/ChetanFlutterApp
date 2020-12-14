import 'package:flutter/material.dart';
// import './card_manager.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _file;
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();
  Future getFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path);
      _showSnackBarMsg('GetFile');
      setState(() {
        _file = file;
      });
    } else {
      // User canceled the picker
    }
  }

  void _uploadFile(filePath) async {
    String fileName = basename(filePath.path);
    print("file base name:$fileName");

    try {
      FormData formData = new FormData.fromMap({
        "name": "Chetan",
        "age": 21,
        "file": await MultipartFile.fromFile(filePath.path, filename: fileName),
      });

      Response response = await Dio().post(
          "http://qna.192.168.211.1.nip.io/api/question",
          data: formData,
          options: Options(headers: {"Accept": "application/json"}));
      print("File upload response: $response");
      _showSnackBarMsg(response.data['message']);
    } catch (e) {
      print("expectation Caugch: $e");
    }
  }

  void _showSnackBarMsg(String msg) {
    _scaffoldstate.currentState.showSnackBar(new SnackBar(
      content: new Text(msg),
    ));
  }

  getDioData() async {
    var dio = Dio();
    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/photos');
    print(response.data[0]);
    return response.data;
  }

  final NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'en_IN');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', 'IN'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'ChetanApp',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      // visualDensity: VisualDensity.adaptivePlatformDensity,
      home: Scaffold(
        key: _scaffoldstate,
        appBar: AppBar(
          title: Text('ChetanApp'),
        ),
        // body: ProductManager(),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text('Upload'),
                onPressed: () {
                  _showSnackBarMsg('upload');
                  _uploadFile(_file);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text('GetFile'),
                onPressed: () {
                  getFile();
                },
              ),
            ),
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: const <Widget>[
                Card(
                  child: ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text('Hello'),
                    subtitle: Text(
                        'A sufficiently long subtitle warrants three lines.'),
                    trailing: Icon(
                      Icons.more_vert,
                    ),
                    isThreeLine: true,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.network_check_sharp),
                    title: const Text("Trix's airplane"),
                    subtitle: Text('The airplane is only in Act II.'),
                    trailing: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
