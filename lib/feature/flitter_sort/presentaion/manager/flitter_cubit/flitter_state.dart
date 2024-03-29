part of 'flitter_cubit.dart';

@immutable
sealed class FlitterState {}

final class FlitterInitial extends FlitterState {}

final class RadioSortChange extends FlitterState {}

final class BrandsChange extends FlitterState {}

final class CategoryChange extends FlitterState {}
