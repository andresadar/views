import 'package:flutter/material.dart';

class IconCart extends StatelessWidget {
  const IconCart({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 3,
                color: Colors.black12)
          ],
        ),
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.grey,
        ),
      ),
    );
  }
}
