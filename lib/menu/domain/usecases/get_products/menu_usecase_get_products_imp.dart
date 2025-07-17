import 'package:bom_hamburguer/menu/domain/repository/menu_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../entities/product_entity.dart';
import 'menu_usecase_get_products.dart';

class MenuUsecaseGetProductsImp implements MenuUsecaseGetProducts {
  final MenuRepository _repository;

  MenuUsecaseGetProductsImp(this._repository);
  @override
  Future<Either<Failure, List<ProductEntity>>> call() async => await _repository.getProducts();
}
