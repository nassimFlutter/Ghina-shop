part of 'featured_products_cubit.dart';

@immutable
sealed class FeaturedProductsState {}

final class FeaturedProductsInitial extends FeaturedProductsState {}

final class FeaturedProductsLoading extends FeaturedProductsState {}

final class FeaturedProductsSuccess extends FeaturedProductsState {}

final class FeaturedProductsFailure extends FeaturedProductsState {
  final String errMessage;

  FeaturedProductsFailure({required this.errMessage});
}
