import 'package:flutter/material.dart';
// import './card_manager.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getDioData() async {
    var dio = Dio();
    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/photos');
    print(response.data[0]);
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChetanApp',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      // visualDensity: VisualDensity.adaptivePlatformDensity,
      home: Scaffold(
        appBar: AppBar(
          title: Text('ChetanApp'),
        ),
        // body: ProductManager(),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: Text(
                'data',
                style: TextStyle(backgroundColor: Colors.blue),
              ),
            ),
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: const <Widget>[
                Card(
                  child: ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text('s'),
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
