part of 'delete_from_my_cart_cubit.dart';

@immutable
sealed class DeleteFromMyCartState {}

final class DeleteFromMyCartInitial extends DeleteFromMyCartState {}

final class DeleteFromMyCartLoading extends DeleteFromMyCartState {}

final class DeleteFromMyCartSuccess extends DeleteFromMyCartState {}

final class DeleteFromMyCartFailures extends DeleteFromMyCartState {
  final String errMessage;

  DeleteFromMyCartFailures({required this.errMessage});
}
