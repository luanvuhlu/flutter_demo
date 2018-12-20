import 'package:flutter/material.dart';

import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(products[index]['title']),
            background: Container(
              color: Colors.red,
            ),
            secondaryBackground: Container(color: Colors.purple),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                deleteProduct(index);
                print('swipe end to start');
              } else if (direction == DismissDirection.startToEnd) {
                print('swipe start to end');
              }
            },
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      products[index]['image'],
                    ),
                  ),
                  title: Text(products[index]['title']),
                  subtitle: Text("\$${products[index]['price']}"),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ProductEditPage(
                          product: products[index],
                          updateProduct: updateProduct,
                          productIndex: index,
                        );
                      }));
                    },
                  ),
                ),
                Divider()
              ],
            ),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
