import 'package:flutter/material.dart';
import './cards.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _project = ['THCBin'];
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                // _project.clear();
                a++;
                _project.add('RajuHawali' + a.toString());
              });
            },
            child: Text('View'),
          ),
        ),
        CardsElement(_project)
      ],
    );
  }
}
