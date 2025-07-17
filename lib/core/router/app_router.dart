import 'package:bom_hamburguer/menu/presentation/cart/cart_page.dart';
import 'package:go_router/go_router.dart';

import '../../menu/presentation/home/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (_, state) => HomePage()),
      GoRoute(path: "/cart", builder: (_, state) => CartPage()),
    ],
  );

  static push(String path) async => await router.push(path);
}
