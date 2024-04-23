part of 'setting_cubit_cubit.dart';

@immutable
sealed class SettingCubitState {}

final class SettingCubitInitial extends SettingCubitState {}

final class SettingCubitLoading extends SettingCubitState {}

final class SettingCubitSuccess extends SettingCubitState {}

final class SettingCubitFailure extends SettingCubitState {
  final String errMessage;

  SettingCubitFailure({required this.errMessage});
}
