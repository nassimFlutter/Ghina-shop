part of 'add_to_cart_cubit.dart';

@immutable
sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartSuccess extends AddToCartState {}

final class AddToCartFailures extends AddToCartState {
  final String error;

  AddToCartFailures({required this.error});
}
