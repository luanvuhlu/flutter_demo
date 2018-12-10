import 'package:flutter/material.dart';

import './pages/product.dart';

class Product extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Product(this.products) {
    print('Product widget constructor');
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            // padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  products[index]['title'],
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(products[index]['price'].toString())
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text('Details'),
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + index.toString()),
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
