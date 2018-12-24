import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final double price;
  final String image;
  final bool isFavorite;

  Product(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.image,
      this.isFavorite = false});
  Product.fromNewFavoriteStatus(Product product, bool isFavorite)
      : this(
            title: product.title,
            description: product.description,
            price: product.price,
            image: product.image,
            isFavorite: isFavorite);
}
