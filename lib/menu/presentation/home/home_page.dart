import 'package:bom_hamburguer/core/widgets/error/core_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/dialogs/core_dialogs.dart';
import '../../../core/widgets/loading/core_loading.dart';
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
                return CoreLoading(text: state.text);
              }

              if (state is AddToCartDenied) {
                return CoreErrorWidget(
                  desc: state.message,
                  title: state.title,
                  type: TypeError.canceled,
                  button: ButtonEntity(
                    label: "Ok",
                    icon: Icons.check,
                    onTap: () => context.read<HomeBloc>().add(RetryToHomeLoaded()),
                  ),
                );
              }

              if (state is HomeGetProductsError) {
                return CoreErrorWidget(
                  desc: state.msg,
                  title: "Error",
                  type: TypeError.warning,
                  button: ButtonEntity.tryAgain(() => context.read<HomeBloc>().add(LoadProducts())),
                );
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
