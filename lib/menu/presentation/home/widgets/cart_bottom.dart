import 'package:bom_hamburguer/menu/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/currency_formatter/util_currency_formatter.dart';

class CartBottom extends StatefulWidget {
  const CartBottom({super.key, required this.cart});
  final CartEntity cart;

  @override
  State<CartBottom> createState() => _CartBottomState();
}

class _CartBottomState extends State<CartBottom> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this)
    ..forward();
  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cart.hasEmpty) return SizedBox(height: 0, width: 0);
    final total = UtilCurrencyFormatter.format(widget.cart.total);

    var textTheme = Theme.of(context).textTheme;
    var radius = Radius.circular(20);
    return SizeTransition(
      sizeFactor: _animation,
      axisAlignment: -1,
      child: Material(
        elevation: 8,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total", style: textTheme.bodyMedium),
                      Text(total, style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                FilledButton.icon(onPressed: () {}, label: Text("Cart"), icon: Icon(Icons.shopping_cart)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
