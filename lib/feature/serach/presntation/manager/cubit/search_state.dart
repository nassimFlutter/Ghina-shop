part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {}

final class SearchFailures extends SearchState {
  final String errMessage;

  SearchFailures({required this.errMessage});
}
