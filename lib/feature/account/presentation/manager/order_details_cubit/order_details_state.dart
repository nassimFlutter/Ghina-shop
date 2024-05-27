part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}

final class OrderDetailsLoading extends OrderDetailsState {}

final class OrderDetailsFailures extends OrderDetailsState {
  final String errMessage;

  OrderDetailsFailures({required this.errMessage});
}

final class OrderDetailsSuccess extends OrderDetailsState {}
