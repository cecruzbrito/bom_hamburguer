import 'package:bom_hamburguer/menu/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/currency_formatter/util_currency_formatter.dart';
import '../../../../core/widgets/animations/size_transition/core_size_transition.dart';

class CartBottom extends StatefulWidget {
  const CartBottom({super.key, required this.cart});
  final CartEntity cart;

  @override
  State<CartBottom> createState() => _CartBottomState();
}

class _CartBottomState extends State<CartBottom> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.cart.hasEmpty) return SizedBox(height: 0, width: 0);
    final total = UtilCurrencyFormatter.format(widget.cart.netTotal);

    var textTheme = Theme.of(context).textTheme;
    var radius = Radius.circular(20);
    var borderRadius = BorderRadius.only(topLeft: radius, topRight: radius);
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2), // 👈 sombra para cima
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CoreSizeTransition(
            duration: Duration(milliseconds: 800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                      Text(total, style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                FilledButton.icon(
                  onPressed: () {
                    AppRouter.push("/cart");
                  },
                  label: Text("Cart"),
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
