import 'package:flutter/cupertino.dart';

import 'product_model.dart';

class CartModel extends ChangeNotifier{
  final List<Product> _lsProducts;
  CartModel(this._lsProducts);

  add(Product product){
    _lsProducts.add(product);
    notifyListeners();
  }
  remove(Product product){
    _lsProducts.remove(product);
    notifyListeners();
  }

  getTotalPrice(){
    num price = 0;

    _lsProducts.forEach((element) {
      price += element.prix;
    });

    return price.roundToDouble();
  }

  getProducts() => _lsProducts;
  getCount() => _lsProducts.length;
}