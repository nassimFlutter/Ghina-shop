part of 'get_all_products_for_store_cubit.dart';

@immutable
sealed class GetAllProductsForStoreState {}

final class GetAllProductsForStoreInitial extends GetAllProductsForStoreState {}

final class GetAllProductsForStoreLoading extends GetAllProductsForStoreState {}

final class GetAllProductsForStoreSuccess extends GetAllProductsForStoreState {
  final List<Product> products;

  GetAllProductsForStoreSuccess({required this.products});
}

final class GetAllProductsForStoreFailures extends GetAllProductsForStoreState {
  final String errMessage;

  GetAllProductsForStoreFailures({required this.errMessage});
}
