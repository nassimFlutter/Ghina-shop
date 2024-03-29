import 'package:best_price/core/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<String> imageList = [
    IconsPath.laptopIcon,
    IconsPath.mobileIcon,
    IconsPath.headphonesIcon,
  ];
  List<String> categoryTitleList = ["Computer", "Phone", "Accessories"];
}
