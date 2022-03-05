import 'package:flutter/material.dart';

import '../../../widgets/buttons/button_row.dart';

class BottomDetailsScreen extends StatelessWidget {
  const BottomDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: kToolbarHeight,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _IncrementDecrementWidget(),
          const SizedBox(width: 10),
          Flexible(
              child: ButtonRow(
            text: 'Agregar \$65.000',
            icon: Icons.shopping_bag_outlined,
            onTap: () {},
          ))
        ],
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
        child: FittedBox(
          child: Icon(icon, color: Colors.green),
        ),
      ),
    );
  }
}
