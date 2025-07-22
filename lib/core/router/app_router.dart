import 'package:bom_hamburguer/menu/presentation/cart/cart_page.dart';
import 'package:bom_hamburguer/menu/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import '../../menu/presentation/home/home_page.dart';
import '../../payment/presentation/bloc/payment_bloc.dart';
import '../../payment/presentation/payment_page.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(path: "/", builder: (_, state) => HomePage()),
      GoRoute(
        path: "/payment",
        builder: (_, state) =>
            BlocProvider(create: (context) => PaymentBloc(context.read(), context.read()), child: PaymentPage()),
      ),
      GoRoute(
        path: "/cart",
        redirect: (context, router) {
          final homeState = context.read<HomeBloc>().state;
          if (homeState is! HomeProductsLoaded) return null;
          if ((homeState).cart.hasEmpty) return "/";
          return null;
        },
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const CartPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              final offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
    ],
  );

  static Future<T?> push<T>(String path) async => await router.push<T>(path);
  static void go<T>(String path) => router.go(path);
  static pop<T>() => router.pop<T>();
}
