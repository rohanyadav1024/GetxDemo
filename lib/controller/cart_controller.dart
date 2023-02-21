import 'package:get/get.dart';
import 'package:getx_demo/model/product_model.dart';

class CartController extends GetxController {
  RxList<Products> cart = (List<Products>.of([])).obs;

  void addtocart(Products products) {
    cart.add(products);
  }

  double get total => cart.fold(0, (sum, it) => sum + it.price);

  void removecart(Products products) {
    cart.remove(products);
  }
}
