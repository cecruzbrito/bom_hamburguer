import 'dart:math';

import 'package:bom_hamburguer/menu/domain/entities/cart_entity.dart';
import 'package:bom_hamburguer/menu/domain/entities/product_entity.dart';
import 'package:bom_hamburguer/menu/errors/errors.dart';
import 'package:bom_hamburguer/menu/infra/datasources/menu_datasource.dart';

import '../../../core/errors/errors.dart';

class MenuDatasourceLocalImp implements MenuDatasource {
  @override
  Future<List<ProductEntity>> getProducts() async {
    await Future.delayed(Duration(seconds: Random().nextInt(3) + 1));
    return [
      ProductEntity(
        name: 'X-Burger',
        desc: 'Sandwich with burger patty',
        price: 5.00,
        type: ProductType.sandwich,
        image: "assets/products/x_burguer.webp",
      ),
      ProductEntity(
        name: 'X-Egg',
        desc: 'Sandwich with egg',
        price: 4.50,
        type: ProductType.sandwich,
        image: "assets/products/x_egg.png",
      ),
      ProductEntity(
        name: 'X-Bacon',
        desc: 'Sandwich with bacon',
        price: 7.00,
        type: ProductType.sandwich,
        image: "assets/products/x_bacon.jpg",
      ),
      ProductEntity(
        name: 'Fries',
        desc: 'Crispy fries',
        price: 2.00,
        type: ProductType.fries,
        image: "assets/products/fries.webp",
      ),
      ProductEntity(
        name: 'Soft drink',
        desc: 'Cold soft drink',
        price: 2.50,
        type: ProductType.softDrink,
        image: "assets/products/soft_drink.webp",
      ),
    ];
  }

  @override
  Future<CartEntity> addInCart(ProductEntity product, {required CartEntity cart}) async {
    try {
      await Future.delayed(Duration(seconds: Random().nextInt(3) + 1));
      if (cart.products.any((p) => p.type == product.type)) {
        throw AddInCartFailure(msg: "You can only add one ${product.type.name.toLowerCase()} per order.");
      }
      return cart.copyWith(products: [...cart.products, product]);
    } on Failure {
      rethrow;
    }
  }

  @override
  Future<CartEntity> removeFromCart(ProductEntity product, {required CartEntity cart}) async {
    await Future.delayed(Duration(seconds: Random().nextInt(3) + 1));
    return cart.copyWith(products: cart.products..remove(product));
  }
}
