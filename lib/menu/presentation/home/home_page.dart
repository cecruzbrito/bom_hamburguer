import 'package:bom_hamburguer/menu/presentation/home/bloc/home_bloc.dart';
import 'package:bom_hamburguer/menu/presentation/home/widgets/product_list_by_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/scroll/core_scroll.dart';
import '../../domain/entities/product_entity.dart';
import 'widgets/cart_bottom.dart';

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
      listener: (_, state) {},
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
                          onTapAddInCart: state.loadingProduct
                              ? null
                              : (product) => context.read<HomeBloc>().add(AddToCart(product: product)),
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
