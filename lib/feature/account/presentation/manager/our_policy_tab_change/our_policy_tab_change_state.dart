part of 'our_policy_tab_change_cubit.dart';

@immutable
sealed class OurPolicyState {}

final class OurPolicyInitial extends OurPolicyState {}

final class OurPolicyTabChange extends OurPolicyState {}
