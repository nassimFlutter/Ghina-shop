part of 'delete_address_cubit.dart';

@immutable
sealed class DeleteAddressState {}

final class DeleteAddressInitial extends DeleteAddressState {}
final class DeleteAddressLoading extends DeleteAddressState {}
final class DeleteAddressSuccess extends DeleteAddressState {}
final class DeleteAddressFailures extends DeleteAddressState {}
