import 'dart:math';

import 'package:bom_hamburguer/menu/domain/entities/cart_entity.dart';
import 'package:bom_hamburguer/menu/domain/entities/product_entity.dart';
import 'package:bom_hamburguer/menu/errors/errors.dart';
import 'package:bom_hamburguer/menu/infra/datasources/menu_datasource.dart';

import '../../../core/errors/errors.dart';
import '../../domain/entities/discount_entity.dart';

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
      // await Future.delayed(Duration(seconds: Random().nextInt(3) + 1));
      if (cart.products.any((p) => p.type == product.type)) {
        throw AddInCartDenied(msg: "You can only add one ${product.type.name.toLowerCase()} per order.");
      }
      var resultCart = cart.copyWith(products: [...cart.products, product]);
      resultCart = calculateCartPricing(resultCart);
      return resultCart;
    } on Failure {
      rethrow;
    }
  }

  CartEntity calculateCartPricing(CartEntity resultCart) {
    resultCart = resultCart.copyWith(discount: applyDiscount(resultCart));
    resultCart = resultCart.copyWith(grossTotal: calculateGrossTotal(resultCart));
    resultCart = resultCart.copyWith(netTotal: calculateNetTotal(resultCart));
    return resultCart;
  }

  DiscountEntity applyDiscount(CartEntity cart) {
    final types = cart.products.map((e) => e.type).toList().toSet();
    if (types.containsAll([ProductType.fries, ProductType.sandwich, ProductType.softDrink])) {
      var percentageDiscount = 0.2;
      final valueDiscount = cart.grossTotal * percentageDiscount;
      return DiscountEntity(
        desc: "Sandwich + Fries + Drink Discount",
        percentage: percentageDiscount,
        valueDiscount: valueDiscount,
      );
    }
    if (types.containsAll([ProductType.sandwich, ProductType.softDrink])) {
      var percentageDiscount = 0.15;
      final valueDiscount = cart.grossTotal * percentageDiscount;
      return DiscountEntity(
        desc: "Sandwich + Drink Discount",
        percentage: percentageDiscount,
        valueDiscount: valueDiscount,
      );
    }
    if (types.containsAll([ProductType.sandwich, ProductType.fries])) {
      var percentageDiscount = 0.1;
      final valueDiscount = cart.grossTotal * percentageDiscount;
      return DiscountEntity(
        desc: "Sandwich + Fries Discount",
        percentage: percentageDiscount,
        valueDiscount: valueDiscount,
      );
    }
    return DiscountEntity.zero;
  }

  double calculateGrossTotal(CartEntity cart) => cart.products.map((p) => p.price).fold(0, (a, b) => a + b);

  double calculateNetTotal(CartEntity cart) {
    if (!cart.discount.hasDiscount) return cart.grossTotal;
    return cart.grossTotal - (cart.grossTotal * cart.discount.percentage);
  }

  @override
  Future<CartEntity> removeFromCart(ProductEntity product, {required CartEntity cart}) async {
    await Future.delayed(Duration(seconds: Random().nextInt(3) + 1));
    var resultCart = cart.copyWith(products: cart.products..remove(product));
    resultCart = calculateCartPricing(resultCart);
    return resultCart;
  }
}
