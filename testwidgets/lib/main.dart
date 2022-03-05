import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testwidgets/screens/home/home_screen.dart';

import 'models/product_model.dart';
import 'screens/store/widgets/item_product.dart';

String priceFormat(num? price) {
  final _oCcy = NumberFormat("#,##0");
  return price == null ? 'Error' : '\$ ' + _oCcy.format(price);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}
