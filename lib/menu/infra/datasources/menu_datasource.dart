import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/home_response_entity.dart';
import '../../domain/entities/product_entity.dart';

abstract class MenuDatasource {
  Future<HomeResponseEntity> getProducts();
  Future<CartEntity> addInCart(ProductEntity product, {required CartEntity cart});
  Future<CartEntity> removeFromCart(ProductEntity product, {required CartEntity cart});
}
