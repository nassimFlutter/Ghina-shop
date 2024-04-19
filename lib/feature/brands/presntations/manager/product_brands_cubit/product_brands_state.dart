part of 'product_brands_cubit.dart';

@immutable
sealed class ProductBrandsState {}

final class ProductBrandsInitial extends ProductBrandsState {}

final class ProductBrandsLoading extends ProductBrandsState {}

final class ProductBrandsSuccess extends ProductBrandsState {}

final class ProductBrandsFailure extends ProductBrandsState {
  final String errMessage;

  ProductBrandsFailure({required this.errMessage});
}
