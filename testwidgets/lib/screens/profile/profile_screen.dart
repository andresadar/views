import 'package:flutter/material.dart';
import 'package:testwidgets/widgets/appbar.dart';

import '../../theme/app_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarStyle1(title: 'Mi Perfil'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ItemProfile(
              label: 'Nombres',
              text: 'Jhon Felipe',
              leading: Icons.person_outlined,
              onTap: () {},
            ),
            const SizedBox(height: 15),
            ItemProfile(
              label: 'Apellidos',
              text: 'Hernandez Isaza',
              leading: Icons.person_outlined,
              onTap: () {},
            ),
            const SizedBox(height: 15),
            ItemProfile(
              label: 'Celular',
              text: '+57 320 200 100',
              leading: Icons.phone_outlined,
              suffix: Icons.edit,
              onTap: () {},
            ),
            const SizedBox(height: 15),
            ItemProfile(
              label: 'Correo electrónico',
              text: 'johnhernandez@gmail.com',
              leading: Icons.email_outlined,
              suffix: Icons.edit,
              onTap: () {},
            ),
            const SizedBox(height: 40),
            ItemProfile(
              label: 'Mis Métodos de Pago',
              leading: Icons.credit_card_outlined,
              suffix: Icons.arrow_forward,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

class ItemProfile extends StatelessWidget {
  const ItemProfile(
      {Key? key,
      required this.label,
      required this.leading,
      this.onTap,
      this.text,
      this.suffix})
      : super(key: key);

  final String label;
  final String? text;
  final IconData leading;
  final IconData? suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(5),
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
              height: kToolbarHeight,
              width: kToolbarHeight,
              // width: kTextTabBarHeight,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              child: FittedBox(child: Icon(leading, color: AppColors.primary)),
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
            const SizedBox(width: 10),
            if (suffix != null)
              Icon(
                suffix,
                color: AppColors.primary,
                size: 30,
              ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
