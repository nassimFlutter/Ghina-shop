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
}
