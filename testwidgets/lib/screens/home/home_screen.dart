import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testwidgets/main.dart';
import 'package:testwidgets/screens/store/store_screen.dart';
import 'package:testwidgets/theme/app_color.dart';
import 'package:testwidgets/widgets/appbar.dart';

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
                  _Header(text: 'Buscar restaurantes', icon: Icons.search),
                  SizedBox(height: 10),

                  //Tags
                  _Tags(),
                  SizedBox(height: 10),

                  //Banners
                  _Banners(),
                  SizedBox(height: 20),
                ],
              ),
            ),

            //Lista de tiendas
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  final _store = _storeExample[index];
                  return ItemStore(
                    store: _store,
                    onTap: () {},
                  );
                },
                childCount: _storeExample.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerModel {
  final String img;

  BannerModel({required this.img});
}

class _Banners extends StatelessWidget {
  const _Banners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemCount: _bannersExample.length,
          itemBuilder: (_, i) {
            final BannerModel _banner = _bannersExample[i];
            return BannerItem(banner: _banner);
          }),
    );
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({Key? key, required this.banner}) : super(key: key);

  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      clipBehavior: Clip.antiAlias,
      height: 80,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CachedNetworkImage(
        imageUrl: banner.img,
        fit: BoxFit.cover,
      ),
    );
  }
}

class IconCart extends StatelessWidget {
  const IconCart({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 3,
                color: Colors.black12)
          ],
        ),
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key, required this.text, required this.icon})
      : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    const _height = 60.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: _height,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: _height,
            width: _height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.black12,
                      blurRadius: 8,
                      spreadRadius: 1)
                ]),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Container(
                    height: _height - 10,
                    width: _height - 10,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryLight,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.search,
                      color: AppColors.primary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: AppColors.primary, fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          3,
          (index) => Container(
            margin: const EdgeInsets.only(right: 20),
            child: ItemTag(
              tag: _tagsExample[index],
            ),
          ),
        ),
      ),
    );
  }
}

class TagModel {
  final String name, img;

  TagModel({required this.name, required this.img});
}

class Store {
  final String? img, name, address, time, promo, tag;

  final double? rating;
  final List? banners, categories;
  final List<Product>? menu;

  Store(
      {this.img,
      this.name,
      this.address,
      this.tag,
      this.time,
      this.promo,
      this.banners,
      this.categories,
      this.menu,
      this.rating});
}

class ItemStore extends StatelessWidget {
  const ItemStore({Key? key, required this.store, this.onTap})
      : super(key: key);

  final Store store;
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
                    imageUrl: store.img ?? '',
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
                  children: [
                    Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${store.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${store.tag}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${store.address}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const WidgetSpan(
                                  child: Icon(Icons.hourglass_bottom, size: 11),
                                  alignment: PlaceholderAlignment.middle),
                              TextSpan(
                                text: '${store.time} mnts.',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Right
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //Rating
                    if (store.rating != null)
                      Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(
                                child: Icon(Icons.star,
                                    color: Colors.amber, size: 18),
                                alignment: PlaceholderAlignment.middle),
                            TextSpan(
                              text: '${store.rating}',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                    //Promo
                    if (store.promo != null)
                      FittedBox(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(Icons.percent_outlined,
                                      color: Colors.green[700], size: 18),
                                  alignment: PlaceholderAlignment.middle),
                              TextSpan(
                                text: '${store.promo}',
                                style: TextStyle(
                                    color: Colors.green[700],
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<TagModel> _tagsExample = [
  TagModel(
      name: 'Hamburguesa',
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png'),
  TagModel(
      name: 'Típico',
      img:
          'https://elviajerofeliz.com/wp-content/uploads/2021/04/comida-tipica-de-inglaterra-1.jpg'),
  TagModel(
      name: 'Pollo',
      img:
          'https://www.elespectador.com/resizer/bDTQsp0uz7EL5OpVkZDinXzDd2E=/1200x675/filters:format(jpeg)/cloudfront-us-east-1.images.arcpublishing.com/elespectador/2F4WF2CH7BC4DCCLMRBGS34KVQ.jpg'),
];

List<BannerModel> _bannersExample = [
  BannerModel(
      img:
          'https://i.pinimg.com/550x/3e/be/a6/3ebea6466fc17a8eedc3493a8a4e44e2.jpg'),
  BannerModel(
      img:
          'https://bk-latam-prod.s3.amazonaws.com/sites/burgerking.com.br/files/Picanha---Banner---1800x760.jpg'),
];

List<Store> _storeExample = [
  Store(
      img:
          'https://www.emprendedores.es/wp-content/uploads/2015/09/mcdonald-s-1024x677.png',
      name: 'Mc Donalds',
      tag: 'Hamburguesas',
      address: 'Calle XYZ, #00-00',
      promo: 'Promo 15%',
      time: '10',
      rating: 4.5),
  Store(
    img:
        'https://paseosanrafael.com/wp-content/uploads/2019/11/KFC_new_logo-800x720.png',
    name: 'KFC',
    tag: 'Pollo',
    address: 'Piso 3 Plaza fuente, local 1191',
    promo: null,
    time: '10',
    rating: 4.5,
  ),
  Store(
      img:
          'https://media-cdn.tripadvisor.com/media/photo-p/1c/eb/86/b8/macondo-punta-prima.jpg',
      name: 'Macondo',
      tag: 'Típica',
      address: 'Piso 2 Aves María',
      promo: 'Promo 15%',
      time: '10',
      rating: 4.5),
  Store(
      img:
          'https://embed.walk360.co/Content/images/3D5F8200-11F5-4542-B84D-599B23A67611..png',
      name: 'Mc Chef Burguer',
      tag: 'Hamburguesas',
      address: 'Calle XYZ, #00-00',
      promo: 'Promo 15%',
      time: '10',
      rating: 4.5),
  Store(
      img:
          'https://eltesoro.com.co/wp-content/uploads/2020/07/presto-logo-el-tesoro-1.png',
      name: 'Presto',
      tag: 'Hamburguesas',
      address: 'Calle XYZ, #00-00',
      promo: null,
      time: '10',
      rating: 4.5),
  Store(
      img: 'https://cityplazacc.com/wp-content/uploads/2020/01/PARMESSANO.jpg',
      name: 'Parmessano',
      tag: 'Restaurante',
      address: 'Calle XYZ, #00-00',
      promo: 'Promo 15%',
      time: '10',
      rating: null),
];
