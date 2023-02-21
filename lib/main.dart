import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/model/product_model.dart';
import 'package:getx_demo/view/shopping_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeApp());
  }
}
