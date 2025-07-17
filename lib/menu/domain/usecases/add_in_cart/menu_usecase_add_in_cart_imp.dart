import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../entities/cart_entity.dart';
import '../../entities/product_entity.dart';
import '../../repository/menu_repository.dart';
import 'menu_usecase_add_in_cart.dart';

class MenuUsecaseAddInCartImp implements MenuUsecaseAddInCart {
  final MenuRepository _repository;

  MenuUsecaseAddInCartImp(this._repository);

  @override
  Future<Either<Failure, CartEntity>> call(ProductEntity product, {required CartEntity cart}) async =>
      await _repository.addInCart(product, cart: cart);
}
