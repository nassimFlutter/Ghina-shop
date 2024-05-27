import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'terminate_account_state.dart';

class TerminateAccountCubit extends Cubit<TerminateAccountState> {
  TerminateAccountCubit() : super(TerminateAccountInitial());
}
