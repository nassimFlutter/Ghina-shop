part of 'rate_product_cubit.dart';

@immutable
sealed class RateProductState {}

final class RateProductInitial extends RateProductState {}

final class RateProductLoading extends RateProductState {}

final class RateProductSuccess extends RateProductState {}

final class RateProductFailures extends RateProductState {
  final String errMessage;

  RateProductFailures({required this.errMessage});
}
