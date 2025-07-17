import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../entities/cart_entity.dart';
import '../../entities/product_entity.dart';
import '../../repository/menu_repository.dart';
import 'menu_usecase_remove_from_cart.dart';

class MenuUsecaseRemoveFromCartImp implements MenuUsecaseRemoveFromCart {
  final MenuRepository _repository;

  MenuUsecaseRemoveFromCartImp(this._repository);

  @override
  Future<Either<Failure, CartEntity>> call(ProductEntity product, {required CartEntity cart}) async =>
      await _repository.removeFromCart(product, cart: cart);
}
