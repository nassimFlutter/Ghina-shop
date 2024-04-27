part of 'my_wish_cubit.dart';

@immutable
sealed class MyWishState {}

final class MyWishInitial extends MyWishState {}

final class MyWishLoading extends MyWishState {}

final class MyWishSuccess extends MyWishState {}

final class MyWishFailures extends MyWishState {
  final String errMessage;

  MyWishFailures({required this.errMessage});
}
