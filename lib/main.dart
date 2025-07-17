import 'package:bom_hamburguer/menu/external/datasource/menu_datasource_local_imp.dart';
import 'package:bom_hamburguer/menu/infra/repository/menu_repository_imp.dart';
import 'package:bom_hamburguer/menu/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'menu/menu_module.dart';
import 'menu/presentation/home/home_page.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [...MenuModule.providers],
      child: MultiBlocProvider(providers: [...MenuModule.blocs], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange)),
      home: HomePage(),
    );
  }
}
