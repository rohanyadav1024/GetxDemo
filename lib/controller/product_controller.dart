import 'package:get/get.dart';
import 'package:getx_demo/model/product_model.dart';

class ShoppingController extends GetxController {
  // List<Products> products = [].obs as List<Products>;
  RxList<Products> products = (List<Products>.of([])).obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    await Future.delayed(Duration(seconds: 1));
    var response = [
      Products(1, 'iphoneX', 10000),
      Products(2, 'SamsungS22', 20000),
      Products(3, '1plus', 30000)
    ];

    products.value = response;
  }
}
