import 'package:flutter/material.dart';

import './pages/product.dart';

class Product extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Product(this.products, {this.deleteProduct}) {
    print('Product widget constructor');
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text('Details'),
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/product/' + index.toString())
                        .then((bool value) {
                      if (value != null && value) {
                        deleteProduct(index);
                      }
                    }),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget emptyProduct() {
    return Center(
      child: Text('No product found'),
    );
  }

  Widget _buildProductLists() {
    if (products.length == 0) {
      return emptyProduct();
    }
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: products.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Product widget build');
    return _buildProductLists();
  }
}
