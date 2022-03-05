import 'package:flutter/material.dart';

import '../../../theme/app_color.dart';

class HeaderSearch extends StatelessWidget {
  const HeaderSearch({Key? key, required this.text, required this.icon})
      : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    const _height = 60.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: _height,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: _height,
            width: _height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.black12,
                      blurRadius: 8,
                      spreadRadius: 1)
                ]),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Container(
                    height: _height - 10,
                    width: _height - 10,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryLight,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.search,
                      color: AppColors.primary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: AppColors.primary, fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
