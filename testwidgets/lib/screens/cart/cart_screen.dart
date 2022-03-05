import 'package:flutter/material.dart';
import 'package:testwidgets/widgets/appbar.dart';
import 'package:testwidgets/widgets/buttons/button_row.dart';

import '../../models/cart_model.dart';
import 'widgets/cart_list.dart';
import 'widgets/recommendations.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarStyle1(title: 'Tu orden'),
      body: Column(
        children: [
          //Elementos del carrito por tiendas
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 20),
              children: [
                ...List.generate(
                    cartExample.store.length,
                    (index) => CartList(
                        products: cartExample.products,
                        store: cartExample.store[index])),

                //Recomendaciones
                const Recommendations()
              ],
            ),
          ),

          //Ir a pagar
          ButtonRow(
            text: 'Pagar ahora \$167.000',
            icon: Icons.shopping_bag_outlined,
            onTap: () {},
          )
        ],
      ),
      // body: ListView.builder(itemBuilder: itemBuilder)
    );
  }
}
