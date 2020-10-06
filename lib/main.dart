import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _project = ['THCBin'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChetanApp',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      // visualDensity: VisualDensity.adaptivePlatformDensity,
      home: Scaffold(
        appBar: AppBar(
          title: Text('ChetanApp'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _project.add('RajuHawali');
                  });
                },
                child: Text('View'),
              ),
            ),
            Column(
              children: _project
                  .map((element) => Card(
                        child: Column(
                          children: <Widget>[
                            // Image.asset('assets/chetan.jpg'),
                            Text(element)
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
