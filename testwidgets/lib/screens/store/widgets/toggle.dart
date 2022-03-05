import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_color.dart';

class ToggleStoreScreen extends StatelessWidget {
  const ToggleStoreScreen(
      {Key? key,
      required this.text,
      required this.icon,
      required this.myIndex,
      required this.index,
      this.onTap})
      : super(key: key);

  final String text;
  final IconData icon;
  final int myIndex, index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final _grey = Colors.grey[300];

    final _selected = index == myIndex;
    return ElasticIn(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: _selected ? AppColors.primary : _grey),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(color: _selected ? Colors.white : Colors.grey),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: _selected ? Colors.white : _grey,
                  shape: BoxShape.circle,
                ),
                child: FittedBox(
                  child: Icon(
                    icon,
                    color: _selected ? AppColors.primary : Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
