import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/banner_model.dart';

class Banners extends StatelessWidget {
  const Banners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemCount: bannersExample.length,
          itemBuilder: (_, i) {
            final BannerModel _banner = bannersExample[i];
            return BannerItem(banner: _banner);
          }),
    );
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({Key? key, required this.banner}) : super(key: key);

  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      clipBehavior: Clip.antiAlias,
      height: 80,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CachedNetworkImage(
        imageUrl: banner.img,
        fit: BoxFit.cover,
      ),
    );
  }
}
