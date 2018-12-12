import 'package:flutter/material.dart';
import 'dart:async';
import '../product_manager.dart';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductPage(this.product);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(product['title']),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(product['image']),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    product['title'],
                    style: TextStyle(fontSize: 30, fontFamily: 'Oswald'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "\$${product['price'].toString()}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Container(
              child: Text(
                product['description'],
                style: TextStyle(fontSize: 20),
              ),
              margin: EdgeInsets.all(10),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Delete'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
