// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductEntity {
  final String name;
  final String desc;
  final double price;
  final ProductType type;
  final String? image;

  ProductEntity({required this.name, required this.desc, required this.price, required this.type, this.image});
}

enum ProductType {
  sandwich,
  fries,
  softDrink;

  String get name => switch (this) {
    ProductType.sandwich => "Sandwiches",
    ProductType.fries => "Fries",
    ProductType.softDrink => "Soft Drinkies",
  };
}
