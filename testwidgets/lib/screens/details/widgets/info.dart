import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../models/product_model.dart';

class InfoProductDetailsScreen extends StatelessWidget {
  const InfoProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${product.name}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),

        //Description
        Text(
          '${product.description}',
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),

        //Precios
        product.promotion != null
            ? Text.rich(
                TextSpan(
                    text: priceFormat(product.promotion) + '  ',
                    children: [
                      TextSpan(
                        text: priceFormat(product.price),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red[800],
                            decoration: TextDecoration.lineThrough),
                      )
                    ]),
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                priceFormat(product.price),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold,
                ),
              ),

        const SizedBox(height: 20),
      ],
    );
  }
}
