import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_address_page_state.dart';

class ChangeAddressPageCubit extends Cubit<ChangeAddressPageState> {
  ChangeAddressPageCubit() : super(ChangeAddressPageInitial());
  static ChangeAddressPageCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  final List<String> accommodationTypeList = ['Apartment', 'Home', 'Office'];
  void changePage(int index) {
    selectedIndex = index;
    emit(ChangePage());
  }
}
