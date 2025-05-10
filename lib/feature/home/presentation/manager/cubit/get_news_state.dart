part of 'get_news_cubit.dart';

@immutable
sealed class GetNewsState {}

final class GetNewsInitial extends GetNewsState {}

final class GetNewsLoading extends GetNewsState {}

final class GetNewsSuccess extends GetNewsState {
  final NewsResponseModel allNews;

  GetNewsSuccess({required this.allNews});
}

final class GetNewsFailures extends GetNewsState {
  final Failure error;

  GetNewsFailures({required this.error});
}
