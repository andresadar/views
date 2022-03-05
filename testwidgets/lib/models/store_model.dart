import 'product_model.dart';

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

List<Store> storeExample = [
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

final Store storeCurrent = Store(
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
