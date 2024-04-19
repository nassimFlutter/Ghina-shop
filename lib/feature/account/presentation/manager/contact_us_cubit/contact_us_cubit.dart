import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/repo/contact_us_repo/contact_us_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());
  static ContactUsCubit get(context) => BlocProvider.of(context);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> contactUsFormKey = GlobalKey<FormState>();

  List<String> iconList = [
    IconsPath.callIcon,
    IconsPath.whatsAppIcon,
    IconsPath.instagramIcon,
    IconsPath.faceBookIcon,
    IconsPath.xIcon,
    IconsPath.tikTokIcon,
    IconsPath.mailIcon
  ];

  Future<void> contactUs() async {
    if (!contactUsFormKey.currentState!.validate()) {
      return;
    }
    emit(ContactUsLoading());
    var result = await getIt.get<ContactUsRepo>().contactUs(
        emailController.text,
        mobileNumberController.text,
        fullNameController.text,
        messageController.text);
    result.fold((error) {
      emit(ContactUsFailure());
    }, (sendResponse) {
      emit(ContactUsSusses(response: sendResponse));
    });
  }
}
