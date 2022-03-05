import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:testwidgets/screens/details/details_screen.dart';
import 'package:testwidgets/widgets/icon_button.dart';

import '../../main.dart';
import '../home/home_screen.dart';

final Store _store = Store(
    img: 'https://okdiario.com/img/2021/05/28/hamburguesa-3.jpg',
    name: 'Mc Donalds',
    tag: 'Hamburguesas',
    address: 'Calle XYZ, #00-00',
    promo: 'Promo 15%',
    time: '10',
    rating: 4.5,
    banners: [
      'https://okdiario.com/img/2021/05/28/hamburguesa-3.jpg',
      'https://cdn.colombia.com/gastronomia/2013/09/18/hot-dog-de-gusanos-frescos-3246-1.jpg',
      'https://topadventure.com/__export/1597001823905/sites/laverdad/img/2020/08/09/mejores_restaurantes.jpg_1209900187.jpg',
      'https://media.admagazine.com/photos/618a5d11532cae908aaf27ab/master/w_1600%2Cc_limit/96644.jpg',
    ],
    categories: [
      'Descuentos',
      'Pop Corn',
      'Sandwiches',
      'Postres',
      'Bebidas',
      'Otros'
    ],
    menu: [
      Product(
          img:
              'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
          description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
          like: true,
          name: 'Big box pop',
          price: 11000,
          promotion: 10000,
          categories: ['Pop Corn', 'Descuentos']),
      Product(
          img:
              'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
          description: '2 presas de pollo, pop corn.',
          like: false,
          name: 'Big box pop',
          price: 11000,
          promotion: null,
          categories: ['Sandwiches']),
      Product(
          img:
              'https://images.getduna.com/66x3s3sr325goc7ruvuimntrz67g.jpg?d=400x400%3E',
          description: '2 presas de pollo, pop corn.',
          like: false,
          name: 'Big box pop',
          price: 11000,
          promotion: null,
          categories: ['Pop Corn', 'Postres']),
    ]);

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  double dotsPosition = 0.0;
  late final _pageController = PageController();
  final _bottomHeight = kToolbarHeight + 65;

  //Toggle
  int _toggleIndex = 0;

  final _grey = Colors.grey[200];

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
    final _scroll = ScrollController();
    return Scaffold(
      body: DefaultTabController(
        length: _store.categories?.length ?? 0,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: Colors.green,
                  // floating: true,
                  pinned: true,
                  elevation: 0,
                  expandedHeight: 400,
                  // snap: true,
                  title: Row(
                    children: [
                      AppIconButton(
                          icon: Icons.arrow_back,
                          tooltip: 'Volver',
                          onTap: () {}),
                      const Spacer(),
                      AppIconButton(
                          icon: Icons.search, tooltip: 'Buscar', onTap: () {})
                    ],
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Stack(
                      children: [
                        Positioned.fill(
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _store.banners?.length ?? 0,
                            itemBuilder: ((context, index) {
                              return CachedNetworkImage(
                                imageUrl: _store.banners?[index] ?? '',
                                placeholder: (_, __) {
                                  return Container(color: Colors.grey[200]);
                                },
                                fit: BoxFit.cover,
                                // color: Colors.grey[200],
                                errorWidget: (_, __, ___) {
                                  return const Center(
                                    child: Icon(Icons.restaurant,
                                        color: Colors.grey),
                                  );
                                },
                              );
                            }),
                          ),
                        ),
                        Positioned(
                            left: 10,
                            right: 10,
                            bottom: _bottomHeight,
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  if (_store.rating != null)
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          const WidgetSpan(
                                            child: Icon(Icons.star,
                                                color: Colors.white, size: 15),
                                          ),
                                          TextSpan(
                                            text: ' ${_store.rating}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white38,
                                        ),
                                        child: DotsIndicator(
                                          dotsCount:
                                              _store.banners?.length ?? 0,
                                          position: dotsPosition,
                                          decorator: const DotsDecorator(
                                              activeColor: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppIconButton(
                                      icon: Icons.share_outlined,
                                      tooltip: 'Compartir',
                                      color: Colors.white,
                                      size: 16,
                                      onTap: () {}),
                                  const SizedBox(width: 10),
                                  AppIconButton(
                                      icon: Icons.favorite_border,
                                      tooltip: 'Favorito',
                                      color: Colors.white,
                                      size: 16,
                                      onTap: () {})
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(_bottomHeight),
                    child: Container(
                      height: _bottomHeight,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: kToolbarHeight,
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: _grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _itemToggle('Para Consumir', Icons.restaurant,
                                      myIndex: 0),
                                  _itemToggle('Para Llevar  ',
                                      Icons.car_repair_outlined,
                                      myIndex: 1),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: TabBar(
                              isScrollable: true,
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              indicatorColor: Colors.green,
                              padding: const EdgeInsets.all(0),
                              tabs: List.generate(
                                _store.categories?.length ?? 0,
                                (index) => Text(
                                  _store.categories![index],
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey[900],
                              indicator: RectangularIndicator(
                                color: Colors.green,
                                verticalPadding: 0,
                                bottomLeftRadius: 100,
                                bottomRightRadius: 100,
                                topLeftRadius: 100,
                                topRightRadius: 100,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
          body: TabBarView(
            children: List.generate(
              _store.categories?.length ?? 0,
              (index) => ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: List.generate(
                  _store.menu
                          ?.where((element) => element.categories!
                              .contains(_store.categories![index]))
                          .length ??
                      0,
                  (index2) {
                    List _products = [];

                    for (var item in _store.menu!.where(
                      (element) => element.categories!.contains(
                        _store.categories![index],
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

  Widget _itemToggle(String text, IconData icon, {required int myIndex}) {
    final _selected = _toggleIndex == myIndex;

    return ElasticIn(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          setState(() {
            _toggleIndex = myIndex;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: _selected ? Colors.green : _grey),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(color: _selected ? Colors.white : Colors.grey),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: _selected ? Colors.white : _grey,
                  shape: BoxShape.circle,
                ),
                child: FittedBox(
                  child: Icon(
                    icon,
                    color: _selected ? Colors.green : Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String? name, description, img, store;
  final int? price, promotion;
  final bool? like;
  final List? categories;

  Product(
      {this.name,
      this.store,
      this.description,
      this.img,
      this.price,
      this.promotion,
      this.categories,
      this.like});
}

class ItemProduct extends StatelessWidget {
  const ItemProduct({Key? key, required this.product, this.onTap})
      : super(key: key);

  final Product product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 140,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Left
            Expanded(
              child: FittedBox(
                child: Container(
                  margin: const EdgeInsets.all(0),
                  clipBehavior: Clip.antiAlias,
                  constraints: const BoxConstraints(
                      maxWidth: 60, maxHeight: 60, minWidth: 60, minHeight: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.img ?? '',
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) {
                      return const Icon(Icons.restaurant, color: Colors.grey);
                    },
                  ),
                ),
              ),
            ),

            //Center
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Nombre
                    Text(
                      '${product.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),

                    //Descripción
                    Text(
                      '${product.description}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),

                    const SizedBox(height: 5),

                    //Precios
                    product.promotion != null
                        ? Text.rich(
                            TextSpan(
                                text: priceFormat(product.promotion) + '  ',
                                children: [
                                  TextSpan(
                                    text: priceFormat(product.price),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red[800],
                                        decoration: TextDecoration.lineThrough),
                                  )
                                ]),
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            priceFormat(product.price),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
              ),
            ),

            //Right
            Container(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  icon: Icon(
                    product.like ?? false
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Colors.red[800],
                    size: 18,
                  ),
                  onPressed: () {
                    //TODO: Funcionalidad de agregar a favoritos
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
