part of 'random_products_cubit.dart';

@immutable
sealed class RandomProductsState {}

final class RandomProductsInitial extends RandomProductsState {}

final class RandomProductsLoading extends RandomProductsState {}

final class RandomProductsSuccess extends RandomProductsState {
  final List<Product> products;

  RandomProductsSuccess({required this.products});
}

final class RandomProductsFailure extends RandomProductsState {}
