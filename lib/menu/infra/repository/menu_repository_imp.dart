import 'package:bom_hamburguer/core/errors/errors.dart';
import 'package:bom_hamburguer/menu/domain/entities/cart_entity.dart';
import 'package:bom_hamburguer/menu/domain/entities/product_entity.dart';
import 'package:bom_hamburguer/menu/domain/repository/menu_repository.dart';
import 'package:bom_hamburguer/menu/infra/datasources/menu_datasource.dart';
import 'package:dartz/dartz.dart';

class MenuRepositoryImp implements MenuRepository {
  final MenuDatasource _datasource;

  MenuRepositoryImp(this._datasource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      return Right(await _datasource.getProducts());
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, CartEntity>> addInCart(ProductEntity product, {required CartEntity cart}) async {
    try {
      return Right(await _datasource.addInCart(product, cart: cart));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, CartEntity>> removeFromCart(ProductEntity product, {required CartEntity cart}) async {
    try {
      return Right(await _datasource.removeFromCart(product, cart: cart));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
