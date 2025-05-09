part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderSuccess extends OrderState {}

final class OrderFailures extends OrderState {
  final String errMessage;

  OrderFailures({required this.errMessage});
}
