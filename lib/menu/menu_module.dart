import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/repository/menu_repository.dart';
import 'domain/usecases/add_in_cart/menu_usecase_add_in_cart.dart';
import 'domain/usecases/add_in_cart/menu_usecase_add_in_cart_imp.dart';
import 'domain/usecases/get_products/menu_usecase_get_products.dart';
import 'domain/usecases/get_products/menu_usecase_get_products_imp.dart';
import 'domain/usecases/remove_from_cart/menu_usecase_remove_from_cart.dart';
import 'domain/usecases/remove_from_cart/menu_usecase_remove_from_cart_imp.dart';
import 'external/datasource/menu_datasource_local_imp.dart';
import 'infra/datasources/menu_datasource.dart';
import 'infra/repository/menu_repository_imp.dart';
import 'presentation/home/bloc/home_bloc.dart';

class MenuModule {
  static final providers = [
    RepositoryProvider(create: (_) => MenuDatasourceLocalImp()),
    RepositoryProvider<MenuDatasource>(create: (_) => MenuDatasourceLocalImp()),
    RepositoryProvider<MenuRepository>(create: (context) => MenuRepositoryImp(context.read())),
    // usecases
    RepositoryProvider<MenuUsecaseGetProducts>(create: (context) => MenuUsecaseGetProductsImp(context.read())),
    RepositoryProvider<MenuUsecaseAddInCart>(create: (context) => MenuUsecaseAddInCartImp(context.read())),
    RepositoryProvider<MenuUsecaseRemoveFromCart>(create: (context) => MenuUsecaseRemoveFromCartImp(context.read())),
  ];

  static final blocs = [BlocProvider(create: (context) => HomeBloc(context.read(), context.read(), context.read()))];
}
