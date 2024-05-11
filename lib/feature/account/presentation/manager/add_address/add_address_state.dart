part of 'add_address_cubit.dart';

@immutable
sealed class AddAddressState {}

final class AddAddressInitial extends AddAddressState {}

final class SelectChange extends AddAddressState {}

final class AddAddressLoading extends AddAddressState {}

final class AddAddressSuccess extends AddAddressState {}

final class AddAddressFailures extends AddAddressState {
  final String errMessage;

  AddAddressFailures({required this.errMessage});
}
