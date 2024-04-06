part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final bool statueMessage;
  final String message;
  SignUpSuccess({required this.statueMessage, required this.message});
}

final class SignUpFailure extends SignUpState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
