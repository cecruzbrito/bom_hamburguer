part of 'home_bloc.dart';

sealed class HomeEvent {}

class LoadProducts extends HomeEvent {}

class AddToCart extends HomeEvent {
  final ProductEntity product;

  AddToCart({required this.product});
}

class RetryToHomeLoaded extends HomeEvent {}

class RemoveFromCart extends HomeEvent {
  final ProductEntity product;

  RemoveFromCart({required this.product});
}

class CompleteSale extends HomeEvent {}
