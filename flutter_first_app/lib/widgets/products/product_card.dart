import 'package:flutter/material.dart';

import './price_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Image.asset(product['image']),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleDefault(product['title']),
            SizedBox(width: 20.0),
            PriceTag(product['price'].toString()),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        AddressTag('Asia Oriental Kitchen, Mundo E'),
        ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed<bool>(
                    context, '/product/' + productIndex.toString());
              }),
          IconButton(
              icon: Icon(Icons.favorite_border),
              color: Colors.red,
              onPressed: () {
                print('Favorite');
              }),
        ])
      ],
    ));
  }
}
