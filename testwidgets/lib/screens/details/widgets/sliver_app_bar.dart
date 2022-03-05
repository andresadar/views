import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testwidgets/models/product_model.dart';

import '../../../theme/app_color.dart';
import '../../../widgets/icon_button.dart';

class SliverAppBarDetailsScreen extends StatelessWidget {
  const SliverAppBarDetailsScreen({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
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
              onTap: () => Navigator.pop(context)),
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
    );
  }
}
