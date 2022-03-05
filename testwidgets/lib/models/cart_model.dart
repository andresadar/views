import 'product_model.dart';

class CartModel {
  final List<Product> products;
  final List<String> store;

  CartModel({required this.store, required this.products});
}

//Carrito de compras
CartModel cartExample = CartModel(store: [
  'KFC',
  'Macondo'
], products: [
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'KFC',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'Macondo',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'Macondo',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
]);

//Recomendaciones
List<Product> recommendationsExample = [
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'KFC',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'Macondo',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
  Product(
      img:
          'https://www.saborusa.com/wp-content/uploads/2019/10/Rompe-la-rutina-con-una-suculenta-hamburguesa-con-queso-Foto-destacada.png',
      description: '2 presas de pollo, pop corn, ensalada y gaseosa 350 ml.',
      store: 'Macondo',
      like: true,
      name: 'Big box pop',
      price: 11000,
      promotion: 10000,
      categories: ['Pop Corn', 'Descuentos']),
];
