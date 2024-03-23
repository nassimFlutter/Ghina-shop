part of 'connectivity_cubit.dart';

@immutable
sealed class ConnectivityState {}

final class ConnectivityInitial extends ConnectivityState {}
final class Connected extends ConnectivityState {}
final class Disconnected extends ConnectivityState {}
