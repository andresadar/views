import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {Key? key,
      this.onTap,
      required this.tooltip,
      required this.icon,
      this.color = Colors.white,
      this.size = 24})
      : super(key: key);

  final VoidCallback? onTap;
  final String tooltip;
  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white24,
          ),
          child: Icon(icon, color: color, size: size),
        ),
      ),
    );
  }
}
