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
