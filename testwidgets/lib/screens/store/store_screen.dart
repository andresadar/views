import 'package:flutter/material.dart';
import 'package:testwidgets/models/store_model.dart';
import 'package:testwidgets/screens/details/details_screen.dart';

import 'widgets/item_product.dart';
import 'widgets/sliver_app_bar.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late final _pageController = PageController();
  double dotsPosition = 0.0;

  //Toggle
  int _toggleIndex = 0;

  void positionListener() {
    setState(() {
      dotsPosition = _pageController.page!;
    });
  }

  @override
  void initState() {
    _pageController.addListener(positionListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(positionListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: storeCurrent.categories?.length ?? 0,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                //Imagen, botón de compartir y favoritos
                SliverAppBarStoreScreen(
                  dotsPosition: dotsPosition,
                  pageController: _pageController,
                ),
              ]),
          body: TabBarView(
            children: List.generate(
              storeCurrent.categories?.length ?? 0,
              (index) => ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: List.generate(
                  storeCurrent.menu
                          ?.where((element) => element.categories!
                              .contains(storeCurrent.categories![index]))
                          .length ??
                      0,
                  (index2) {
                    List _products = [];

                    for (var item in storeCurrent.menu!.where(
                      (element) => element.categories!.contains(
                        storeCurrent.categories![index],
                      ),
                    )) {
                      _products.add(item);
                    }

                    return ItemProduct(
                      product: _products[index2],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(product: _products[index2]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
