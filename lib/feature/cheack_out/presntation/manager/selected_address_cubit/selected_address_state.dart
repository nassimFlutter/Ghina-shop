part of 'selected_address_cubit.dart';

@immutable
sealed class SelectedAddressState {}

final class SelectedAddressInitial extends SelectedAddressState {}

final class SelectedAddressSuccess extends SelectedAddressState {
  final int index;

  SelectedAddressSuccess({required this.index});
}

final class SelectedAddressFailures extends SelectedAddressState {}
