import 'package:bom_hamburguer/menu/presentation/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import '../../menu/presentation/home/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(path: "/", builder: (_, state) => HomePage()),
      GoRoute(
        path: "/cart",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const CartPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // 👉 da direita para a esquerda (padrão Android)
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
  static pop<T>() => router.pop<T>();
}
