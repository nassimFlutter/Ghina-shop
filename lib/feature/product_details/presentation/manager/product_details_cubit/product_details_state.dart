part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsCubitLoading extends ProductDetailsState {}

final class ProductDetailsCubitFailure extends ProductDetailsState {
  final String errMessage;

  ProductDetailsCubitFailure({required this.errMessage});
}

final class ProductDetailsCubitSuccess extends ProductDetailsState {}

final class IndexChanges extends ProductDetailsState {}
