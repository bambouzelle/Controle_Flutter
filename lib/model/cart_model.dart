import 'package:flutter/cupertino.dart';
import 'package:flutter_sales/model/product_model.dart';

class CartModel extends ChangeNotifier{
  final List<Product> lsProduct;

  CartModel(this.lsProduct);

  addProduct(Product product){
    lsProduct.add(product);
    notifyListeners();
  }

  removeAllProducts(){
    lsProduct.clear();
    notifyListeners();
  }

  removeProduct(Product p){
    lsProduct.remove(p);
    notifyListeners();
  }

  num getPriceCart(){
    return lsProduct.fold<num>(0.0, (previousValue, element)
    => previousValue+element.price);
  }
}