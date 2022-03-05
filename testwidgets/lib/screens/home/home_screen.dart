import 'package:testwidgets/screens/store/store_screen.dart';
import 'package:testwidgets/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:testwidgets/screens/home/widgets/header.dart';

import '../../models/store_model.dart';
import '../../widgets/buttons/icon_cart.dart';
import 'widgets/banner.dart';
import 'widgets/item_store.dart';
import 'widgets/tags.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            //AppBar
            const AppBarStyle1(
                title: 'El Tesoro Parque Comercial',
                suffix: IconCart(),
                sliver: true),
            SliverList(
              delegate: SliverChildListDelegate(
                const [
                  SizedBox(height: 10),

                  //Header
                  HeaderSearch(text: 'Buscar restaurantes', icon: Icons.search),
                  SizedBox(height: 10),

                  //Tags
                  Tags(),
                  SizedBox(height: 10),

                  //Banners
                  Banners(),
                  SizedBox(height: 20),
                ],
              ),
            ),

            //Lista de tiendas
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  final _store = storeExample[index];
                  return ItemStore(
                    store: _store,
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const StoreScreen();
                    })),
                  );
                },
                childCount: storeExample.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
