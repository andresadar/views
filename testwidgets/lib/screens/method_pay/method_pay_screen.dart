import 'package:flutter/material.dart';
import 'package:testwidgets/screens/method_pay/widgets/item_pay.dart';

import '../../widgets/appbar.dart';

class MethodPayScreen extends StatelessWidget {
  const MethodPayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarStyle1(title: 'Métodos de pago'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          ItemMethodPay2(
              label: 'Métodos de pago', preffix: Icons.credit_card_outlined)
        ],
      ),
    );
  }
}
