import 'package:flutter/material.dart';
import 'package:testwidgets/widgets/appbar.dart';

import 'widgets/item_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarStyle1(title: 'Mi Perfil'),
      body: ListView(
        padding: const EdgeInsets.all(20),
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
    );
  }
}
