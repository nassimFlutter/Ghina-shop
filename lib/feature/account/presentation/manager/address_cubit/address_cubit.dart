import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/address_model/address_model.dart';
import 'package:best_price/feature/account/data/repo/address_repo/address_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  AddressModel myAddress = AddressModel();
  static AddressCubit get(context) => BlocProvider.of(context);
  List<String> typeUi = ["Appartment", 'Home', 'Office', "aaa", "aaaa"];
  Future<void> getMyAddress() async {
    emit(AddressLoading());
    var result = await getIt.get<AddressRepo>().getAllAddress();
    result.fold((error) {
      emit(AddressFailures(errMessage: error.errMassage));
    }, (allAddress) {
      emit(AddressSuccess());
      myAddress = allAddress;
    });
  }
}
