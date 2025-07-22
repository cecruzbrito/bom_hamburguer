import 'package:bom_hamburguer/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/loading/core_loading.dart';
import '../../../core/widgets/scroll/core_scroll.dart';
import '../../../core/widgets/snack_bars/core_snack_bars.dart';
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
        listener: (_, state) {
          if (state is RemoveFromCartSuccess) {
            CoreSnackBars.success(state.message);
          }

          if (state is RemoveFromCartError) {
            CoreSnackBars.error(state.message);
          }
        },
        builder: (_, state) {
          if (state is HomeLoading) {
            return CoreLoading(text: state.text);
          }

          if (state is HomeProductsLoaded) {
            if (state.cart.hasEmpty) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text("The cart is empty"),
                    ElevatedButton.icon(
                      onPressed: () => AppRouter.go("/"),
                      label: Text("Back to home"),
                      icon: Icon(Icons.home),
                    ),
                  ],
                ),
              );
            }

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
