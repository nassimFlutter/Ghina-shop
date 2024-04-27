part of 'area_cubit.dart';

@immutable
sealed class AreaState {}

final class AreaInitial extends AreaState {}

final class AreaLoading extends AreaState {}

final class AreaSuccess extends AreaState {}

final class AreaFailures extends AreaState {
  final String errMessage;

  AreaFailures({required this.errMessage});
}
