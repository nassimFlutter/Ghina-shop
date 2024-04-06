part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final bool state;
  final String message;

  ForgetPasswordSuccess({required this.state, required this.message});
}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errMessage;

  ForgetPasswordFailure({required this.errMessage});
}
