part of 'add_order_cubit.dart';

@immutable
sealed class AddOrderState {}

class AddOrderLoading extends AddOrderState {}

final class AddOrderInitial extends AddOrderState {}

class AddOrderSuccess extends AddOrderState {
  final String successMessage;

  AddOrderSuccess({required this.successMessage});
}

class AddOrderError extends AddOrderState {
  final String errorMessage;

  AddOrderError({required this.errorMessage});
}
