import 'package:flutter/material.dart';

import './product_edit.dart';
import './product_list.dart';
import '../models/product.dart';

class AdminPage extends StatelessWidget {
  final Function addProduct, updateProduct, deleteProduct;
  final List<Product> products;

  AdminPage(this.addProduct, this.updateProduct, this.deleteProduct, this.products);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('All Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Product Manager'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Products',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductEditPage(addProduct: addProduct),
            ProductListPage(
              products,
              updateProduct,
              deleteProduct
            )
          ],
        ),
      ),
    );
  }
}
