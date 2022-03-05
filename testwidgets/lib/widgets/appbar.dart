import 'package:flutter/material.dart';
import 'package:testwidgets/theme/app_color.dart';

class AppBarStyle1 extends StatelessWidget implements PreferredSizeWidget {
  const AppBarStyle1(
      {Key? key, required this.title, this.suffix, this.sliver = false})
      : super(key: key);

  final String? title;
  final Widget? suffix;
  final bool sliver;

  @override
  Widget build(BuildContext context) {
    return sliver
        ? SliverAppBar(
            floating: true,
            pinned: false,
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: title != null
                ? Text(
                    title!,
                    style:
                        const TextStyle(color: AppColors.primary, fontSize: 16),
                  )
                : null,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                child: const Icon(Icons.arrow_back, color: AppColors.primary),
                decoration: const BoxDecoration(
                  color: AppColors.bg,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            actions: [suffix ?? const SizedBox(), const SizedBox(width: 5)],
          )
        : AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: title != null
                ? Text(
                    title!,
                    style:
                        const TextStyle(color: AppColors.primary, fontSize: 16),
                  )
                : null,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                child: const Icon(Icons.arrow_back, color: AppColors.primary),
                decoration: const BoxDecoration(
                  color: AppColors.bg,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            actions: [suffix ?? const SizedBox(), const SizedBox(width: 5)],
          );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
