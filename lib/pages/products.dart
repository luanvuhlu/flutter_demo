import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/products/products.dart';
import '../models/product.dart';
import '../scoped-models/product.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage();

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          ScopedModelDescendant<ProductModel>(
            builder: (BuildContext context, Widget child, ProductModel model) {
              final bool allFavorites = model.isAllFavorites();
              return IconButton(
                icon:
                    Icon(allFavorites ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  model.toggleAllProductFavoriteStatus(allFavorites);
                },
              );
            },
          )
        ],
      ),
      body: Products(),
    );
  }
}
