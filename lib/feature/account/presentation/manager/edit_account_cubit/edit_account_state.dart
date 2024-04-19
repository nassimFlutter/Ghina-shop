part of 'edit_account_cubit.dart';

@immutable
sealed class EditAccountState {}

final class EditAccountInitial extends EditAccountState {}

final class EditAccountLoading extends EditAccountState {}

final class EditAccountSuccess extends EditAccountState {}

final class EditAccountFailure extends EditAccountState {
  final String errMessage;

  EditAccountFailure({required this.errMessage});
}
