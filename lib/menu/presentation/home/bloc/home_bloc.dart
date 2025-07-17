import 'package:bom_hamburguer/menu/domain/usecases/get_products/menu_usecase_get_products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/cart_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/usecases/add_in_cart/menu_usecase_add_in_cart.dart';
import '../../../domain/usecases/remove_from_cart/menu_usecase_remove_from_cart.dart';
import '../../../errors/errors.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MenuUsecaseGetProducts _usecaseGetProducts;
  final MenuUsecaseAddInCart _usecaseAddInCart;
  final MenuUsecaseRemoveFromCart _usecaseRemoveFromCart;
  HomeBloc(this._usecaseGetProducts, this._usecaseAddInCart, this._usecaseRemoveFromCart) : super(HomeStarted()) {
    on<AddToCart>(_onAddInCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<LoadProducts>(_onLoadProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    await Future.delayed(Duration(seconds: 2));
    final response = await _usecaseGetProducts();
    response.fold((l) => null, (r) => emit(HomeProductsLoaded(products: r, cart: CartEntity.empty)));
  }

  void _onAddInCart(AddToCart event, Emitter<HomeState> emit) async {
    if (state is! HomeProductsLoaded) return;
    var current = (state as HomeProductsLoaded);
    emit(current.copyWith(loadingProduct: true));
    final response = await _usecaseAddInCart(event.product, cart: current.cart);
    response.fold(
      (l) {
        if (l is AddInCartDenied) {
          emit(AddToCartDenied(l.msg));
        } else {
          emit(AddToCartError(l.msg));
        }
        emit(current.copyWith(loadingProduct: false));
      },
      (r) {
        emit(AddToCartSuccess("The product has been added to your order!"));
        emit(current.copyWith(cart: r, loadingProduct: false));
      },
    );
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<HomeState> emit) async {
    if (state is! HomeProductsLoaded) return;
    var current = (state as HomeProductsLoaded);
    emit(current.copyWith(loadingProduct: true));
    final response = await _usecaseRemoveFromCart(event.product, cart: current.cart);
    response.fold(
      (l) {
        emit(RemoveFromCartError(l.msg));
        emit(current.copyWith(loadingProduct: false));
      },
      (r) {
        emit(RemoveFromCartSuccess("The product has been removed from your order!"));
        emit(current.copyWith(cart: r, loadingProduct: false));
      },
    );
  }
}
