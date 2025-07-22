import 'package:bom_hamburguer/menu/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/currency_formatter/util_currency_formatter.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product, required this.onTapAddInCart});
  final ProductEntity product;
  final Function(ProductEntity) onTapAddInCart;
  @override
  Widget build(BuildContext context) {
    final title = product.name;
    final subtitle = product.desc;
    final image = product.image;
    final price = UtilCurrencyFormatter.format(product.price);
    var textTheme = Theme.of(context).textTheme;
    var width = 200.0;
    var heightImage = 150.0;
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
                style: textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(price),
            ],
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: FilledButton.icon(
              label: Text("Add to Cart"),
              onPressed: () => onTapAddInCart(product),
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
