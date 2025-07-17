// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'discount_entity.dart';
import 'product_entity.dart';

class CartEntity {
  final List<ProductEntity> products;
  final DiscountEntity discount;
  final double grossTotal;
  final double netTotal;
  CartEntity({required this.products, required this.discount, required this.grossTotal, required this.netTotal});

  static final CartEntity empty = CartEntity(products: [], discount: DiscountEntity.zero, grossTotal: 0, netTotal: 0);

  bool get hasEmpty => products.isEmpty;

  CartEntity copyWith({
    List<ProductEntity>? products,
    DiscountEntity? discount,
    double? grossTotal,
    double? netTotal,
  }) => CartEntity(
    products: products ?? this.products,
    discount: discount ?? this.discount,
    grossTotal: grossTotal ?? this.grossTotal,
    netTotal: netTotal ?? this.netTotal,
  );
}
