part of 'add_address_cubit.dart';

@immutable
sealed class AddAddressState {}

final class AddAddressInitial extends AddAddressState {}

final class SelectChange extends AddAddressState {}
