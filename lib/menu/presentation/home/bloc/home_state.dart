// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomeLoading extends HomeState {
  final String? text;

  HomeLoading({this.text});

  @override
  List<Object?> get props => [text];
}

final class HomeStarted extends HomeState {}

final class HomeGetProductsError extends HomeState {
  final String msg;

  HomeGetProductsError({required this.msg});
}

final class HomeProductsLoaded extends HomeState {
  final List<ProductEntity> products;
  final CartEntity cart;

  HomeProductsLoaded({required this.products, required this.cart});

  @override
  List<Object?> get props => [products, cart];

  HomeProductsLoaded copyWith({List<ProductEntity>? products, CartEntity? cart}) {
    return HomeProductsLoaded(products: products ?? this.products, cart: cart ?? this.cart);
  }
}

class AddToCartSuccess extends HomeState {
  final String message;

  AddToCartSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class AddToCartError extends HomeState {
  final String message;

  AddToCartError(this.message);

  @override
  List<Object?> get props => [message];
}

class AddToCartDenied extends HomeState {
  final String title = "Add to Cart Denied";
  final String message;
  final HomeState? previousState;

  AddToCartDenied(this.message, this.previousState);

  @override
  List<Object?> get props => [title, message, previousState];
}

class RemoveFromCartSuccess extends HomeState {
  final String message;

  RemoveFromCartSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class RemoveFromCartError extends HomeState {
  final String message;

  RemoveFromCartError(this.message);

  @override
  List<Object?> get props => [message];
}
