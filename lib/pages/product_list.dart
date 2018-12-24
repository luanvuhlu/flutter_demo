import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './product_edit.dart';
import '../scoped-models/product.dart';

class ProductListPage extends StatelessWidget {
  Widget _buildEditButton(BuildContext context, int index, ProductModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selecteProduct(index);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ProductEditPage();
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductModel>(
      builder: (BuildContext context, Widget child, ProductModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.products[index].title),
              background: Container(
                color: Colors.red,
              ),
              secondaryBackground: Container(color: Colors.purple),
              onDismissed: (DismissDirection direction) {
                model.selecteProduct(index);
                if (direction == DismissDirection.endToStart) {
                  model.deleteProduct();
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
                        model.products[index].image,
                      ),
                    ),
                    title: Text(model.products[index].title),
                    subtitle: Text("\$${model.products[index].price}"),
                    trailing: _buildEditButton(context, index, model),
                  ),
                  Divider()
                ],
              ),
            );
          },
          itemCount: model.products.length,
        );
      },
    );
  }
}
