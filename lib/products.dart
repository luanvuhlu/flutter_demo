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
              mainAxisAlignment: MainAxisAlignment.center,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    "\$${products[index]['price'].toString()}",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6.0)),
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            margin: EdgeInsets.only(top: 6.0),
            child: Text(
              'Union Square Francisco',
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
             IconButton (
               icon: Icon(Icons.info),
               iconSize: 30.0,
                color: Theme.of(context).accentColor,
                // child: Text('Details'),
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + index.toString()),
              ),
              IconButton (
               icon: Icon(Icons.favorite_border),
               iconSize: 30.0,
                color: Colors.red,
                // child: Text('Details'),
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
