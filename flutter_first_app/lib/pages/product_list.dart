import 'package:flutter/material.dart';

import './product_edit.dart';
import '../models/product.dart';

class ProductListPage extends StatelessWidget {
  final Function updateProduct;
  final Function deleteProduct;
  final List<Product> products;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductEditPage(
                product: products[index],
                updateProduct: updateProduct,
                productIndex: index,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
            } else {
              print('Swiped start to end');
            }
          },
          background: Container(
            color: Colors.redAccent,
          ),
          key: Key(products[index].title),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index].image),
                ),
                title: Text(products[index].title),
                subtitle: Text('\$${products[index].price.toString()}'),
                trailing: _buildEditButton(context, index),
              ),
              Divider(),
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
