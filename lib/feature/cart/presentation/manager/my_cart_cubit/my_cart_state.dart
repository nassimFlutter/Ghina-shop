part of 'my_cart_cubit.dart';

@immutable
sealed class MyCartState {}

final class MyCartInitial extends MyCartState {}

final class MyCartLoading extends MyCartState {}

final class MyCartSuccess extends MyCartState {}

final class MyCartFailures extends MyCartState {
  final String errMessage;

  MyCartFailures({required this.errMessage});
}
