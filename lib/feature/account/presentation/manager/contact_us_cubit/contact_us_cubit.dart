import 'package:best_price/core/utils/constants.dart';
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
  List<String> iconList = [
    IconsPath.callIcon,
    IconsPath.whatsAppIcon,
    IconsPath.instagramIcon,
    IconsPath.faceBookIcon,
    IconsPath.xIcon,
    IconsPath.tikTokIcon,
    IconsPath.mailIcon
  ];
}
