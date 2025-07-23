import 'package:bom_hamburguer/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/app_router.dart';
import 'menu/menu_module.dart';
import 'payment/payment_module.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [...MenuModule.providers, ...PaymentModule.providers],
      child: MultiBlocProvider(providers: [...MenuModule.blocs], child: MyApp()),
    ),
  );
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final customTheme = MaterialTheme(Typography.material2021().black);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: AppRouter.router,
      title: 'Flutter Demo',
      darkTheme: customTheme.dark(),
      theme: customTheme.light(),
    );
  }
}
