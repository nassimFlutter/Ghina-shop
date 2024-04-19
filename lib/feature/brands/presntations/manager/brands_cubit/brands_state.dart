part of 'brands_cubit.dart';

@immutable
sealed class BrandsState {}

final class BrandsInitial extends BrandsState {}

final class BrandsLoading extends BrandsState {}

final class BrandsSuccess extends BrandsState {}

final class BrandsFailure extends BrandsState {
  final String errMessage;

  BrandsFailure({required this.errMessage});
}
