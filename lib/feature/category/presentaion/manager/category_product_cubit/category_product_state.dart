part of 'category_product_cubit.dart';

@immutable
sealed class CategoryProductState {}

final class CategoryProductInitial extends CategoryProductState {}

final class CategoryProductLoading extends CategoryProductState {}

final class CategoryProductSuccess extends CategoryProductState {}

final class CategoryProductLoadingMore extends CategoryProductState {}

final class CategoryProductFailure extends CategoryProductState {
  final String errMessage;

  CategoryProductFailure({required this.errMessage});
}
