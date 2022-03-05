import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testwidgets/widgets/appbar.dart';

import '../../main.dart';
import '../store/store_screen.dart';

class CartModel {
  final List<Product> products;
  final List<String> store;

  CartModel({required this.store, required this.products});
}

List<Product> _recommendationsExample = [
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'KFC',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'Macondo',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'Macondo',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
];

CartModel _cartExample = CartModel(store: [
  'KFC',
  'Macondo'
], products: [
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'KFC',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'Macondo',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'Macondo',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
]);

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarStyle1(title: 'Tu orden'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 20),

                //Carrrito
                ...List.generate(
                    _cartExample.store.length,
                    (index) => _ItemCart(
                        products: _cartExample.products,
                        store: _cartExample.store[index])),

                //Recomendaciones

                _Recommendations()
              ],
            ),
          ),

          //Ir a pagar
          Container(
            height: kToolbarHeight,
            color: Colors.white,
            child: const Placeholder(),
          )
        ],
      ),
      // body: ListView.builder(itemBuilder: itemBuilder)
    );
  }
}

class _Recommendations extends StatelessWidget {
  const _Recommendations({Key? key}) : super(key: key);

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
              itemCount: _recommendationsExample.length,
              itemBuilder: (_, index) {
                return _ItemRecommendation(
                  product: _recommendationsExample[index],
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

class _ItemCart extends StatelessWidget {
  const _ItemCart({Key? key, required this.products, required this.store})
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
          (index) => ItemProduct(product: _products[index]),
        )
      ],
    );
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({Key? key, required this.product}) : super(key: key);

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
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          priceFormat(product.price),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green[700],
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
