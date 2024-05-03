part of 'lang_cubit.dart';

@immutable
sealed class LangState {}

final class LangInitial extends LangState {}

final class FirstChooseLangScreenState extends LangState {}

final class ChooseArLangScreenState extends LangState {}

final class ChooseEnLangScreenState extends LangState {}
