import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductModel extends Model {
  List<Product> _products = [];
  int _selectedProductIndex;

  List<Product> get products {
    return List.from(_products);
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void selecteProduct(int index) {
    _selectedProductIndex = index;
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite =
        _products[_selectedProductIndex].isFavorite;
    _products[_selectedProductIndex] = Product.fromNewFavoriteStatus(
        _products[_selectedProductIndex], !isCurrentlyFavorite);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void toggleAllProductFavoriteStatus(bool allFavorites) {
    _products = _products
        .map((product) => Product.fromNewFavoriteStatus(product, !allFavorites))
        .toList();
    notifyListeners();
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  Product get selectedProduct {
    if (_selectedProductIndex == null) {
      return null;
    }
    return _products[_selectedProductIndex];
  }

  bool isAllFavorites() {
    return _products.length > 0 &&
        _products.every((product) => product.isFavorite);
  }
}
