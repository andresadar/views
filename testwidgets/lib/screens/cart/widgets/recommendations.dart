import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../models/cart_model.dart';
import '../../../models/product_model.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Te recomendamos',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendationsExample.length,
              itemBuilder: (_, index) {
                return _ItemRecommendation(
                  product: recommendationsExample[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemRecommendation extends StatelessWidget {
  const _ItemRecommendation({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey, width: .5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: product.img ?? '',
              fit: BoxFit.cover,
              errorWidget: (_, ___, ____) {
                return const Icon(Icons.restaurant, color: Colors.grey);
              },
            ),
          )),
          const SizedBox(height: 5),
          Text(product.store ?? '',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey)),
          Text(product.name ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(
            priceFormat(product.price),
            style: const TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
