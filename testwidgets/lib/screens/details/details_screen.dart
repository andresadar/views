import 'package:flutter/material.dart';
import 'package:testwidgets/screens/details/widgets/comments.dart';
import 'package:testwidgets/screens/details/widgets/info.dart';
import 'package:testwidgets/screens/details/widgets/sliver_app_bar.dart';

import '../../models/product_model.dart';
import 'widgets/bottom.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
              SliverAppBarDetailsScreen(product: product),
            ]),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  //Title
                  InfoProductDetailsScreen(product: product),

                  //TODO: Agregar Adiciones AQUI
                  const SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Placeholder(),
                  ),
                  //TODO: Agregar Adiciones AQUI

                  //Comentarios
                  const CommentsDetailsScreen()
                ],
              ),
            ),

            //Botón agregar al carrito
            const BottomDetailsScreen()
          ],
        ),
      ),
    );
  }
}
