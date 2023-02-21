import 'package:get/get.dart';

class Products {
  final int id;
  final String name;
  final double price;
  final ischeched = false.obs;
  var quantity = 1.obs;

  Products(this.id, this.name, this.price);
}
