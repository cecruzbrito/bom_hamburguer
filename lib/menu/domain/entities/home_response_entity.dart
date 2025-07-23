import 'package:bom_hamburguer/menu/domain/entities/discount_entity.dart';

import 'product_entity.dart';

class HomeResponseEntity {
  final List<ProductEntity> products;
  final List<DiscountEntity> discounts;

  HomeResponseEntity({required this.products, required this.discounts});
}
