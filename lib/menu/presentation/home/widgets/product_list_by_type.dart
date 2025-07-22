// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bom_hamburguer/menu/presentation/home/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/product_entity.dart';

class ProductListByTypes extends StatelessWidget {
  const ProductListByTypes({super.key, required this.product, required this.type, required this.onTapAddInCart});
  final List<ProductEntity> product;
  final ProductType type;
  final Function(ProductEntity) onTapAddInCart;

  @override
  Widget build(BuildContext context) {
    if (product.isEmpty) return Container();
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type.name, style: Theme.of(context).textTheme.headlineSmall),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          primary: false,
          child: Row(
            spacing: 10,
            children: [
              ...product.map((e) => ProductListTile(product: e, onTapAddInCart: onTapAddInCart)),
              SizedBox(width: 5),
            ],
          ),
        ),
      ],
    );
  }
}
