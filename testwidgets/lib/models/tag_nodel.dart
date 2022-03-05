class TagModel {
  final String name, img;

  TagModel({required this.name, required this.img});
}

List<TagModel> tagsExample = [
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
