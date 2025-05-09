part of 'home_cubit.dart';

sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitSuccess extends HomeCubitState {}

final class HomeCubitFailure extends HomeCubitState {
  final String errMessage;
  final int code;

  HomeCubitFailure({required this.errMessage, required this.code});
}
