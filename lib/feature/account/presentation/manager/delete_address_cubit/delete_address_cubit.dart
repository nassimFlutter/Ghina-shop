import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/repo/address_repo/address_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'delete_address_state.dart';

class DeleteAddressCubit extends Cubit<DeleteAddressState> {
  DeleteAddressCubit() : super(DeleteAddressInitial());
  Response deleteAddressResponse = Response(status: false);
  static DeleteAddressCubit get(context) => BlocProvider.of(context);
  Future<void> deleteAddress(int addressId) async {
    emit(DeleteAddressLoading());
    var result = await getIt.get<AddressRepo>().deleteAddress(addressId);
    result.fold((error) {
      emit(DeleteAddressFailures());
    }, (deleted) {
      emit(DeleteAddressSuccess());
    });
  }
}
