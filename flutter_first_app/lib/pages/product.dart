import 'package:flutter/material.dart';
import 'dart:async';

import '../widgets/ui_elements/title_default.dart';
import '../widgets/products/price_tag.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final List<Product> products;
  final int index;

  ProductPage(this.products, this.index);

  Widget _buildAddressPriceRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TitleDefault(products[index].title),
        SizedBox(width: 40.0),
        PriceTag(products[index].price.toString()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button presed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(products[index].title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(products[index].image),
            SizedBox(height: 10.0),
            _buildAddressPriceRow(context),
            SizedBox(
              height: 25.0,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Text('Asia Oriental Kitchen, Mundo E')),
            SizedBox(
              height: 25.0,
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    products[index].description,
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
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
