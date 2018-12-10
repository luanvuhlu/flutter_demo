import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductManager(this.products);
  @override
  Widget build(BuildContext context) {
    print('Product Manager build');
    return Column(
      children: [
        Expanded(
          child: Product(products),
        ),
      ],
    );
  }
}
