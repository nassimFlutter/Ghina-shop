import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/feature/account/data/models/address_model/address_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'selected_address_state.dart';

class SelectedAddressCubit extends Cubit<SelectedAddressState> {
  SelectedAddressCubit() : super(SelectedAddressInitial());
  static SelectedAddressCubit get(context) => BlocProvider.of(context);
  int selectedIndex = -1;
  Item addressSelected = Item();
  void initSelected() {
    selectedIndex = -1;
    emit(SelectedAddressInitial());
  }

  void selectAddress(int index) {
    selectedIndex = index;
    LoggerHelper.debug(selectedIndex.toString());
    emit(SelectedAddressSuccess(index: index));
  }
}
