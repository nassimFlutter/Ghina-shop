part of 'get_all_stores_cubit.dart';

@immutable
sealed class GetAllStoresState {}

final class GetAllStoresInitial extends GetAllStoresState {}

final class GetAllStoresLoading extends GetAllStoresState {}

final class GetAllStoresSuccess extends GetAllStoresState {
  final StoreResponse stores;

  GetAllStoresSuccess({required this.stores});
}

final class GetAllStoresFailures extends GetAllStoresState {
  final String errMessage;

  GetAllStoresFailures({required this.errMessage});
}
