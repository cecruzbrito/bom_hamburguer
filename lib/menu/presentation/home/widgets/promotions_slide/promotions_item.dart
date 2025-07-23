import 'package:bom_hamburguer/core/mixins/padding/padding_app.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../../core/utils/percentage_formatter/percentage_formatter.dart';
import '../../../../domain/entities/discount_entity.dart';

class PromotionsItem extends StatelessWidget with PaddingApp {
  PromotionsItem({super.key, required this.actualDiscount});
  final DiscountEntity actualDiscount;
  @override
  Widget build(BuildContext context) {
    final discountTitle = actualDiscount.desc;
    final discountValue = "Discount up to ${PercentageFormatter.format(actualDiscount.percentage)}";
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [Theme.of(context).colorScheme.primary.withValues(alpha: .7), Theme.of(context).colorScheme.primary],
        ),
      ),
      margin: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: Column(
                  key: ValueKey(actualDiscount),
                  spacing: 2,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      discountTitle,
                      style: TextTheme.of(
                        context,
                      ).titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    Text(
                      discountValue,
                      style: TextTheme.of(context).bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ],
                ),
              ),
            ),
            WidgetAnimator(
              atRestEffect: WidgetRestingEffects.wave(),
              incomingEffect: WidgetTransitionEffects.incomingScaleUp(),
              child: Image.asset("assets/icons/delivery-bike.webp", height: 100, width: 100, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
