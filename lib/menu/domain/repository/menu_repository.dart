import 'package:bom_hamburguer/menu/domain/entities/cart_entity.dart';
import 'package:bom_hamburguer/menu/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/errors.dart';
import '../entities/home_response_entity.dart';

abstract class MenuRepository {
  Future<Either<Failure, HomeResponseEntity>> getProducts();
  Future<Either<Failure, CartEntity>> addInCart(ProductEntity product, {required CartEntity cart});
  Future<Either<Failure, CartEntity>> removeFromCart(ProductEntity product, {required CartEntity cart});
}
