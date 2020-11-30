import 'package:flutter/material.dart';

class CardsElement extends StatelessWidget {
  final List<String> carditem;

  CardsElement(this.carditem);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: carditem
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    // Image.asset('assets/chetan.jpg'),
                    Text(element)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
