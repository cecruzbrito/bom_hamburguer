import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../entities/cart_entity.dart';
import '../../entities/product_entity.dart';

abstract class MenuUsecaseAddInCart {
  Future<Either<Failure, CartEntity>> call(ProductEntity product, {required CartEntity cart});
}
