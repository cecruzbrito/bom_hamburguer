import 'package:bom_hamburguer/menu/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    final title = product.name;
    final subtitle = product.desc;
    return ListTile(title: Text(title), subtitle: Text(subtitle));
  }
}
