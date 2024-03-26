part of 'nav_bar_cubit.dart';

@immutable
sealed class NavBarState {}

final class NavBarInitial extends NavBarState {}

final class ChangeTab extends NavBarState {
  final int index;

  ChangeTab({required this.index});
}
