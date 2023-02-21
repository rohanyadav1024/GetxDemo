import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/cart_controller.dart';
import 'package:getx_demo/controller/product_controller.dart';
import 'package:getx_demo/model/product_model.dart';

class HomeApp extends StatelessWidget {
  final productController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  // const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopo'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(children: [
          Expanded(child: GetX<ShoppingController>(builder: (controller) {
            return ListView.builder(
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 100,
                    child: Card(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${productController.products[index].id}'),
                            Text('${productController.products[index].name}'),
                            Text(
                                'Rs.${productController.products[index].price}'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                cartController.addtocart(
                                    productController.products[index]);
                                productController.products[index].quantity++;
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              child: Text('Add To Cart'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  cartController
                                      .removecart(cartController.cart[index]);
                                  controller.products[index].quantity--;
                                },
                                icon:
                                    Icon(Icons.remove_circle_outline_rounded)),
                            GetX<ShoppingController>(builder: (controller) {
                              return Text(
                                  '${controller.products[index].quantity}');
                            }),
                            GetX<ShoppingController>(builder: (controller) {
                              return IconButton(
                                  onPressed: () {
                                    controller.products[index].ischeched
                                        .toggle();
                                  },
                                  icon: controller
                                          .products[index].ischeched.value
                                      ? Icon(Icons.check_box)
                                      : Icon(Icons.check_box_outline_blank));
                            }),
                          ],
                        )
                      ],
                    )),
                  );
                });
          })),
          GetX<CartController>(builder: (cartController) {
            return Text('Total items ${cartController.cart.length}');
          }),
          GetX<CartController>(builder: (cartController) {
            return Text('Total value ${cartController.total}');
          }),
        ]),
      ),
    );
  }
}
