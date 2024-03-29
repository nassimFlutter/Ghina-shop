import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'our_policy_tab_change_state.dart';

class OurPolicyTabChangeCubit extends Cubit<OurPolicyState> {
  OurPolicyTabChangeCubit() : super(OurPolicyInitial());
  static OurPolicyTabChangeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeTab(int index) {
    currentIndex = index;
    emit(OurPolicyTabChange());
  }
}
