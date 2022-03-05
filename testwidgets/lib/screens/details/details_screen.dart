import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testwidgets/screens/store/store_screen.dart';
import 'package:testwidgets/widgets/icon_button.dart';

import '../../main.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.green,
                // floating: true,
                pinned: true,
                elevation: 0,
                expandedHeight: 250,
                // snap: true,
                title: Row(
                  children: [
                    AppIconButton(
                        icon: Icons.arrow_back,
                        tooltip: 'Volver',
                        onTap: () {}),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Stack(
                    children: [
                      Positioned.fill(
                        child: CachedNetworkImage(
                          imageUrl: product.img ?? '',
                          placeholder: (_, __) {
                            return Container(color: Colors.grey[200]);
                          },
                          fit: BoxFit.cover,
                          // color: Colors.grey[200],
                          errorWidget: (_, __, ___) {
                            return const Center(
                              child: Icon(Icons.restaurant, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                      Positioned(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                const Spacer(),
                                AppIconButton(
                                    icon: Icons.share_outlined,
                                    tooltip: 'Compartir',
                                    color: Colors.white,
                                    size: 16,
                                    onTap: () {}),
                                const SizedBox(width: 10),
                                AppIconButton(
                                    icon: Icons.favorite_border,
                                    tooltip: 'Favorito',
                                    color: Colors.white,
                                    size: 16,
                                    onTap: () {})
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ]),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  //Title
                  Text(
                    '${product.name}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                  //Description
                  Text(
                    '${product.description}',
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
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

                  //Adiciones
                  //TODO: Agregar Adiciones
                  const SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Placeholder(),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Comentarios',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),

                  const Text(
                    'Añade instrucciones y/o comentarios',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 10),

                  TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Escribe aquí',
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: kToolbarHeight,
              color: Colors.white,
              child: Row(
                children: [
                  const _IncrementDecrementWidget(),
                  const SizedBox(width: 10),
                  Expanded(
                      child: _AddCart(
                    onTap: () {},
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _IncrementDecrementWidget extends StatelessWidget {
  const _IncrementDecrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.grey[200]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _iconButton(icon: Icons.remove, onTap: () {}),
          const SizedBox(
            width: 10,
          ),
          const Text('1', style: TextStyle(color: Colors.green, fontSize: 18)),
          const SizedBox(
            width: 10,
          ),
          _iconButton(icon: Icons.add, onTap: () {}),
        ],
      ),
    );
  }

  Widget _iconButton({required IconData icon, VoidCallback? onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 5,
                spreadRadius: 3),
          ],
        ),
        child: FittedBox(child: Icon(icon, color: Colors.green)),
      ),
    );
  }
}

class _AddCart extends StatelessWidget {
  const _AddCart({Key? key, this.onTap}) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.green,
        ),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                'Agregar \$65.000',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const FittedBox(
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
