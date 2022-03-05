import 'package:flutter/material.dart';

import '../../../theme/app_color.dart';

class ItemMethodPay extends StatelessWidget {
  const ItemMethodPay({
    Key? key,
    required this.label,
    required this.leading,
    this.onTap,
    this.text,
  }) : super(key: key);

  final String label;
  final String? text;
  final IconData leading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(50),
          border:
              Border.all(width: 1, color: AppColors.primary.withOpacity(.3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: kToolbarHeight * .8,
              width: kToolbarHeight * .8,
              // width: kTextTabBarHeight,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                child: Icon(leading, color: AppColors.primary),
              ),
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: text == null
                  ? Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.primary.withOpacity(.6),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          text!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMethodPay2 extends StatelessWidget {
  const ItemMethodPay2(
      {Key? key,
      this.textController,
      required this.label,
      required this.preffix})
      : super(key: key);

  final String label;
  final TextEditingController? textController;
  final IconData preffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.bg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        labelText: label,
        hintStyle: const TextStyle(color: AppColors.primary),
        labelStyle: const TextStyle(color: AppColors.primary),
        prefixIcon: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 20,
            decoration: const BoxDecoration(
                color: AppColors.primaryLight, shape: BoxShape.circle),
            child: Icon(
              preffix,
              color: AppColors.primary,
            )),
      ),
    );
  }
}
