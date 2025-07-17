import 'package:bom_hamburguer/menu/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/currency_formatter/util_currency_formatter.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key, required this.product, required this.onTapRemove});
  final ProductEntity product;
  final Function(ProductEntity) onTapRemove;
  @override
  Widget build(BuildContext context) {
    final image = product.image;

    final title = product.name;
    final subtitle = product.desc;
    final price = UtilCurrencyFormatter.format(product.price);
    var textTheme = Theme.of(context).textTheme;
    var width = 100.0;
    var heightImage = 100.0;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15),
                  child: Image.asset(image!, height: heightImage, width: width, fit: BoxFit.cover),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(title, style: textTheme.titleMedium),
                      Text(
                        subtitle,
                        style: textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                      Text(price),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton.filledTonal(onPressed: () => onTapRemove(product), icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
