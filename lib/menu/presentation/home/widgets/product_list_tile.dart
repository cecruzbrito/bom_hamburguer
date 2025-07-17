import 'package:bom_hamburguer/menu/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/currency_formatter/util_currency_formatter.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product, required this.onTapAddInCart});
  final ProductEntity product;
  final Function(ProductEntity)? onTapAddInCart;
  @override
  Widget build(BuildContext context) {
    final title = product.name;
    final subtitle = product.desc;
    final image = product.image;
    final price = UtilCurrencyFormatter.format(product.price);
    var textTheme = Theme.of(context).textTheme;
    var width = 230.0;
    var heightImage = 170.0;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15),
            child: Image.asset(image!, height: heightImage, width: width, fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(title, style: textTheme.titleMedium),
              Text(
                subtitle,
                style: textTheme.bodySmall?.copyWith(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(price),
            ],
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: IconButton.filledTonal(
              onPressed: onTapAddInCart == null ? null : () => onTapAddInCart!(product),
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
