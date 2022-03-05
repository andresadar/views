import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testwidgets/screens/home/home_screen.dart';
import 'package:testwidgets/screens/store/store_screen.dart';

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

String priceFormat(num? price) {
  final _oCcy = NumberFormat("#,##0");
  return price == null ? 'Error' : '\$ ' + _oCcy.format(price);
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ItemProduct(
            product: Product(
                img:
                    'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
                description:
                    '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
                like: true,
                name: 'Big box pop',
                price: 11000,
                promotion: 10000),
          ),
          ItemProduct(
            product: Product(
                img:
                    'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
                description: '2 presas de pollo, pop corn.',
                like: false,
                name: 'Big box pop',
                price: 11000,
                promotion: null),
          ),
        ]),
      ),
    );
  }
}

class ItemTag extends StatelessWidget {
  const ItemTag({Key? key, required this.tag}) : super(key: key);

  final TagModel tag;

  @override
  Widget build(BuildContext context) {
    const size = 130.0;
    return Container(
      clipBehavior: Clip.antiAlias,
      constraints: const BoxConstraints(
          maxHeight: size, maxWidth: size, minHeight: size, minWidth: size),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: tag.img,
            fit: BoxFit.cover,
            errorWidget: (_, __, ___) => const Icon(
              Icons.restaurant,
              color: Colors.grey,
            ),
          ),
          Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: buildBlur(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(5),
                  height: size * .25,
                  color: Colors.white38,
                  child: Text(
                    tag.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget buildBlur(
      {required Widget child, double sigmaY = 5, double sigmaX = 5}) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      ),
    );
  }
}
