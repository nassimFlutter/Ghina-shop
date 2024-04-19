part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}

final class ContactUsLoading extends ContactUsState {}

final class ContactUsSusses extends ContactUsState {
  final Response response;

  ContactUsSusses({required this.response});
}

final class ContactUsFailure extends ContactUsState {}
