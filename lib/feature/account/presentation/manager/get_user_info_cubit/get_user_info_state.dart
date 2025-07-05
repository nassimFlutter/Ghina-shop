part of 'get_user_info_cubit.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoLoading extends GetUserInfoState {}

final class GetUserInfoSuccess extends GetUserInfoState {
  final UserInfoResponse userInfo;
  GetUserInfoSuccess({required this.userInfo});
}

final class GetUserInfoFailure extends GetUserInfoState {
  final String error;
  GetUserInfoFailure({required this.error});
}
