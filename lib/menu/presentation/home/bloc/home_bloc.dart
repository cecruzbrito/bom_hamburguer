import 'dart:async';

import 'package:bom_hamburguer/menu/domain/entities/discount_entity.dart';
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
    on<CompleteSale>(_onCompleteSale);
    on<RetryToHomeLoaded>(_onRetryToHomeLoaded);
  }

  void _onLoadProducts(LoadProducts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    await Future.delayed(Duration(seconds: 2));
    final response = await _usecaseGetProducts();
    response.fold(
      (l) => emit(HomeGetProductsError(msg: l.msg)),
      (r) => emit(HomeProductsLoaded(discounts: r.discounts, products: r.products, cart: CartEntity.empty)),
    );
  }

  void _onAddInCart(AddToCart event, Emitter<HomeState> emit) async {
    if (state is! HomeProductsLoaded) return;
    var current = (state as HomeProductsLoaded);
    emit(HomeLoading(text: "Just a moment, adding your selection..."));
    final response = await _usecaseAddInCart(event.product, cart: current.cart);
    response.fold(
      (l) {
        if (l is AddInCartDenied) {
          return emit(AddToCartDenied(l.msg, current));
        }
        emit(AddToCartError(l.msg));
        emit(current.copyWith());
      },
      (r) {
        emit(AddToCartSuccess("The product has been added to your order!"));
        emit(current.copyWith(cart: r));
      },
    );
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<HomeState> emit) async {
    if (state is! HomeProductsLoaded) return;
    var current = (state as HomeProductsLoaded);
    emit(HomeLoading(text: "Just a moment, removing your selection..."));

    final response = await _usecaseRemoveFromCart(event.product, cart: current.cart);
    response.fold(
      (l) {
        emit(RemoveFromCartError(l.msg));
        emit(current);
      },
      (r) {
        emit(RemoveFromCartSuccess("The product has been removed from your order!"));
        emit(current.copyWith(cart: r));
      },
    );
  }

  void _onCompleteSale(CompleteSale event, Emitter<HomeState> emit) {
    if (state is! HomeProductsLoaded) return;
    emit((state as HomeProductsLoaded).copyWith(cart: CartEntity.empty));
  }

  void _onRetryToHomeLoaded(RetryToHomeLoaded event, Emitter<HomeState> emit) {
    if (state is! AddToCartDenied) return;
    if ((state as AddToCartDenied).previousState == null) return;
    emit((state as AddToCartDenied).previousState!);
  }
}
