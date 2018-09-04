import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  final String titleProduct;

  TitleDefault(this.titleProduct);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleProduct,
      style: TextStyle(
          fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
    );
  }
}
