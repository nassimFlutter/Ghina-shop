part of 'change_quantity_cubit.dart';

@immutable
sealed class ChangeQuantityState {}

final class ChangeQuantityInitial extends ChangeQuantityState {}

final class ChangeQuantityLoading extends ChangeQuantityState {}

final class ChangeQuantitySuccess extends ChangeQuantityState {}
final class IncrementQuantitySuccess extends ChangeQuantityState {}

final class ChangeQuantityFailures extends ChangeQuantityState {
  final String errMessage;

  ChangeQuantityFailures({required this.errMessage}); 
}
