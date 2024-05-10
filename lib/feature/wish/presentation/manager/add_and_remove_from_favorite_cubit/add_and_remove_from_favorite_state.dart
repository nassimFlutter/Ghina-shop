part of 'add_and_remove_from_favorite_cubit.dart';

@immutable
sealed class AddAndRemoveFromFavoriteState {}

final class AddAndRemoveFromFavoriteInitial
    extends AddAndRemoveFromFavoriteState {}

final class AddAndRemoveFromFavoriteLoading
    extends AddAndRemoveFromFavoriteState {}

final class AddAndRemoveFromFavoriteSuccess
    extends AddAndRemoveFromFavoriteState {
  final String successMessage;

  AddAndRemoveFromFavoriteSuccess({required this.successMessage});
}

final class AddAndRemoveFromFavoriteFailures
    extends AddAndRemoveFromFavoriteState {
  final String errMessage;

  AddAndRemoveFromFavoriteFailures({required this.errMessage});
}
