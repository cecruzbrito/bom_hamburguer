// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'product_entity.dart';

class CartEntity {
  final List<ProductEntity> products;
  static final CartEntity empty = CartEntity(products: []);
  CartEntity({required this.products});

  bool get hasEmpty => products.isEmpty;

  double get totalProducts => products.map((p) => p.price).fold(0, (a, b) => a + b);

  double get total => totalProducts;

  CartEntity copyWith({List<ProductEntity>? products}) => CartEntity(products: products ?? this.products);
}
