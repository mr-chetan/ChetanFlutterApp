import 'package:flutter/material.dart';
import './card_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        body: ProductManager(),
      ),
    );
  }
}
