import 'package:bom_hamburguer/core/mixins/padding/padding_app.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/percentage_formatter/percentage_formatter.dart';
import '../../../domain/entities/discount_entity.dart';

class PromotionsSlide extends StatelessWidget with PaddingApp {
  PromotionsSlide({super.key, required this.discounts});
  final List<DiscountEntity> discounts;
  @override
  Widget build(BuildContext context) {
    if (discounts.isEmpty) return Container();
    final discount = discounts.first;
    final discountTitle = discount.desc;
    final discountValue = "Discount up to ${PercentageFormatter.format(discount.percentage)}";
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                spacing: 2,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(discountTitle, style: TextTheme.of(context).titleMedium),
                  Text(discountValue, style: TextTheme.of(context).bodyMedium),
                ],
              ),
            ),
            Image.asset("assets/icons/delivery-bike.webp", height: 100, width: 100, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
