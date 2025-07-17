import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/dialogs/core_dialogs.dart';
import '../../../core/widgets/scroll/core_scroll.dart';
import '../../../core/widgets/snack_bars/core_snack_bars.dart';
import '../../domain/entities/product_entity.dart';
import 'bloc/home_bloc.dart';
import 'widgets/cart_bottom.dart';
import 'widgets/product_list_by_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (_, state) {
        if (state is AddToCartSuccess) {
          CoreSnackBars.success(state.message);
        }

        if (state is AddToCartError) {
          CoreSnackBars.error(state.message);
        }

        if (state is AddToCartDenied) {
          CoreDialogs.showDialogOKError(state.title, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Bom Hamburguer")),

          bottomNavigationBar: state is HomeProductsLoaded
              ? state.cart.hasEmpty
                    ? null
                    : CartBottom(cart: state.cart)
              : null,
          body: Builder(
            builder: (_) {
              if (state is HomeLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is HomeProductsLoaded) {
                return CoreScroll(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Column(
                    spacing: 30,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...ProductType.values.map(
                        (t) => ProductListByTypes(
                          hasLoading: state.loadingProduct,
                          onTapAddInCart: (product) => context.read<HomeBloc>().add(AddToCart(product: product)),
                          product: state.products.where((p) => p.type == t).toList(),
                          type: t,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        );
      },
    );
  }
}

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.primaryContainer, colorScheme.primary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
