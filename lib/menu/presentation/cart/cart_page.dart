import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/scroll/core_scroll.dart';
import '../home/bloc/home_bloc.dart';
import 'widgets/cart_product_item.dart';
import 'widgets/summary_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (_, __) {},
        builder: (_, state) {
          if (state is HomeProductsLoaded) {
            return Column(
              children: [
                Expanded(
                  child: CoreScroll(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...state.cart.products.map(
                          (p) => CartProductItem(
                            product: p,
                            onTapRemove: (product) => context.read<HomeBloc>().add(RemoveFromCart(product: product)),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                SummaryCart(cart: state.cart),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
