import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/tag_nodel.dart';

class Tags extends StatelessWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          3,
          (index) => Container(
            margin: const EdgeInsets.only(right: 20),
            child: ItemTagStoreScreen(
              tag: tagsExample[index],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemTagStoreScreen extends StatelessWidget {
  const ItemTagStoreScreen({Key? key, required this.tag}) : super(key: key);

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
