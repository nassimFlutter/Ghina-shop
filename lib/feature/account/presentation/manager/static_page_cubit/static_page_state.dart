part of 'static_page_cubit.dart';

@immutable
sealed class StaticPageState {}

final class StaticPageInitial extends StaticPageState {}

final class StaticPageLoading extends StaticPageState {}

final class StaticPageSuccess extends StaticPageState {}

final class StaticPageFailures extends StaticPageState {
  final String errMessage;

  StaticPageFailures({required this.errMessage});
}
