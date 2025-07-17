// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomeLoading extends HomeState {}

final class HomeLoadingAddProduct extends HomeState {}

final class HomeStarted extends HomeState {}

final class HomeProductsLoaded extends HomeState {
  final List<ProductEntity> products;
  final CartEntity cart;
  final bool loadingProduct;

  HomeProductsLoaded({required this.products, required this.cart, this.loadingProduct = false});

  @override
  List<Object?> get props => [products, cart, loadingProduct];

  HomeProductsLoaded copyWith({List<ProductEntity>? products, CartEntity? cart, bool? loadingProduct}) {
    return HomeProductsLoaded(
      products: products ?? this.products,
      cart: cart ?? this.cart,
      loadingProduct: loadingProduct ?? this.loadingProduct,
    );
  }
}

class HomeError extends HomeState {
  final String msg;

  HomeError({required this.msg});
  @override
  List<Object?> get props => [msg];
}
