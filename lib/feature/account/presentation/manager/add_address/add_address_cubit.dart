import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/address_model/add_address_model.dart';
import 'package:best_price/feature/account/data/models/address_model/address_model.dart';
import 'package:best_price/feature/account/data/repo/address_repo/address_repo.dart';
import 'package:best_price/feature/account/presentation/manager/area_cubit/area_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/change_address_page/change_address_page_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit() : super(AddAddressInitial());
  static AddAddressCubit get(context) => BlocProvider.of(context);
  final TextEditingController addressTitleController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController blockNoController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController avenueController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController floorNoController = TextEditingController();
  final TextEditingController flatNoController = TextEditingController();
  final TextEditingController extraDirectionsController =
      TextEditingController();
  final TextEditingController houseNoController = TextEditingController();
  final TextEditingController officeNoController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> apartmentForm = GlobalKey<FormState>();
  void clearControllers() {
    addressTitleController.clear();
    mobileNumberController.clear();
    fullNameController.clear();
    blockNoController.clear();
    streetController.clear();
    avenueController.clear();
    buildingController.clear();
    floorController.clear();
    floorNoController.clear();
    flatNoController.clear();
    extraDirectionsController.clear();
    houseNoController.clear();
    officeNoController.clear();
  }

  Future<void> addAddress(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(AddAddressLoading());
    AddAddressModel addMyAddress = AddAddressModel(
        fullName: fullNameController.text,
        flatNumber: flatNoController.text,
        mobileNumber: mobileNumberController.text,
        addressName: addressTitleController.text,
        areaId: BlocProvider.of<AreaCubit>(context).selectedAreaId,
        block: blockNoController.text,
        street: streetController.text,
        avenue: avenueController.text,
        type: BlocProvider.of<ChangeAddressPageCubit>(context).selectedIndex,
        houseNumber: houseNoController.text,
        officeNumber: officeNoController.text,
        notes: extraDirectionsController.text);
    var result =
        await getIt.get<AddressRepo>().addAddress(addMyAddress.toJson());
    LoggerHelper.info(addMyAddress.toJson().toString());
    result.fold((error) {
      AddAddressFailures(errMessage: error.errMassage);
    }, (added) {
      emit(AddAddressSuccess());
    });
  }
}
