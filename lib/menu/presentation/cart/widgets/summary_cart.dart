// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bom_hamburguer/core/utils/currency_formatter/util_currency_formatter.dart';
import 'package:bom_hamburguer/menu/domain/entities/cart_entity.dart';

import '../../../../core/mixins/padding_app.dart';
import '../../../../core/widgets/animations/size_transition/core_size_transition.dart';
import '../../../../core/widgets/dotted_line/core_dotted_line.dart';

class SummaryCart extends StatelessWidget with PaddingApp {
  SummaryCart({super.key, required this.cart});
  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    final grossTotal = UtilCurrencyFormatter.format(cart.grossTotal);
    final grossTotalTitle = "Total";
    final discount = UtilCurrencyFormatter.format(cart.discount.valueDiscount);
    final discountTitle = "Discount";
    final totalPaymentTitle = "Total Payment";
    final totalPayment = UtilCurrencyFormatter.format(cart.netTotal);
    var textTheme = Theme.of(context).textTheme;
    var radius = Radius.circular(20);
    var borderRadius = BorderRadius.only(topLeft: radius, topRight: radius);

    if (cart.hasEmpty) return Container();
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, -2), blurRadius: 6, spreadRadius: 0)],
      ),
      child: CoreSizeTransition(
        duration: Duration(milliseconds: 800),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: paddingScrollDefault + EdgeInsets.symmetric(vertical: 5) + EdgeInsets.only(top: 15),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Order Summary", style: textTheme.titleLarge),
                  Column(
                    spacing: 15,
                    children: [
                      ItemTitleAndDesc(title: grossTotalTitle, desc: grossTotal),
                      ItemTitleAndDesc(title: discountTitle, desc: discount),
                      CoreDottedLine(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ItemTitleAndDesc(title: totalPaymentTitle, desc: totalPayment, bigger: true),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {},
                      child: Padding(padding: EdgeInsets.symmetric(vertical: 15), child: Text("Process Order")),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemTitleAndDesc extends StatelessWidget {
  const ItemTitleAndDesc({super.key, required this.title, required this.desc, this.bigger = false});
  final String title;
  final String desc;
  final bool bigger;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: (bigger ? textTheme.bodyLarge : textTheme.bodyMedium)?.copyWith(
            color: bigger ? null : Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        Text(desc, style: (bigger ? textTheme.bodyLarge : textTheme.bodyMedium)?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
