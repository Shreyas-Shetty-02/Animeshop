class CatalogModel {
  static List<Item> items = [];

  getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  // final String? name2;

  Item(
      {required this.id,
      // required this.name2,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
  // : assert(Item != null);

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      color: map["color"],
      image: map["image"],
      price: map["price"],
      // name2: map["name2"],
    );
  }
}
