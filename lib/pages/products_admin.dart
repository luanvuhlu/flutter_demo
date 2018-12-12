import 'package:flutter/material.dart';

import './products.dart';
import './product_create.dart';
import './product_list.dart';

class ProductAdminPage extends StatelessWidget {

  final List<Map<String, dynamic>> products;
  final Function addProduct;
  final Function deleteProduct;
 
  ProductAdminPage(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text('Choose'),
                  automaticallyImplyLeading: false,
                ),
                ListTile(
                  leading: Icon(Icons.shop),
                  title: Text('All Products'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('EasyList'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon((Icons.create)),
                  text: 'Create product',
                ),
                Tab(
                  icon: Icon((Icons.list)),
                  text: 'My Product',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[ProductCreatePage(addProduct), 
            ProductListPage(products)],
          )),
    );
  }
}
