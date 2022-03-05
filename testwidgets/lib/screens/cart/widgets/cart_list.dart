import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../models/product_model.dart';
import '../../../theme/app_color.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key, required this.products, required this.store})
      : super(key: key);

  final List<Product> products;
  final String store;

  @override
  Widget build(BuildContext context) {
    List<Product> _products = [];

    for (Product item in products) {
      if (item.store == store) {
        _products.add(item);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: .5)
                    ]),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  store,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ...List.generate(
          _products.length,
          (index) => _ItemCart(product: _products[index]),
        )
      ],
    );
  }
}

class _ItemCart extends StatelessWidget {
  const _ItemCart({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 140,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Left
          Expanded(
            child: FittedBox(
              child: Container(
                margin: const EdgeInsets.all(0),
                clipBehavior: Clip.antiAlias,
                constraints: const BoxConstraints(
                    maxWidth: 60, maxHeight: 60, minWidth: 60, minHeight: 60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: CachedNetworkImage(
                  imageUrl: product.img ?? '',
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) {
                    return const Icon(Icons.restaurant, color: Colors.grey);
                  },
                ),
              ),
            ),
          ),

          //Center
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Nombre
                  Text(
                    '${product.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),

                  //Descripción
                  Text(
                    '${product.description}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),

                  const SizedBox(height: 5),

                  //Precios
                  product.promotion != null
                      ? Text.rich(
                          TextSpan(
                              text: priceFormat(product.promotion) + '  ',
                              children: [
                                TextSpan(
                                  text: priceFormat(product.price),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red[800],
                                      decoration: TextDecoration.lineThrough),
                                )
                              ]),
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          priceFormat(product.price),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ],
              ),
            ),
          ),

          //Right
          Container(
            alignment: Alignment.bottomRight,
            child: IconButton(
                icon: Icon(
                  product.like ?? false
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: Colors.red[800],
                  size: 18,
                ),
                onPressed: () {
                  //TODO: Funcionalidad de agregar a favoritos
                }),
          ),
        ],
      ),
    );
  }
}
