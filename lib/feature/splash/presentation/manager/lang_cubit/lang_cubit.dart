import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/feature/category/presentaion/manager/category_cubit/category_cubit.dart';
import 'package:best_price/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:best_price/feature/stores/presntation/managers/get_all_products_for_store_cubit/get_all_stores_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());
  static LangCubit get(context) => BlocProvider.of(context);
  String lang = CacheHelper.getData(key: Keys.kLang);

  void firstChooseLang({required String language}) async {
    lang = language; //CacheHelper.getData(key: Keys.kLang);
    await CacheHelper.setData(key: Keys.kLang, value: language);
    emit(FirstChooseLangScreenState());
  }

  void changeLang(context, {required String language}) {
    if (language != lang) {
      if (language == 'en') {
        CacheHelper.setData(key: Keys.kLang, value: 'en');
        lang = language;
        emit(ChooseEnLangScreenState());
      } else {
        CacheHelper.setData(key: Keys.kLang, value: 'ar');
        lang = language;
        emit(ChooseArLangScreenState());
      }
    }
    BlocProvider.of<HomeCubit>(context).getHomePage();
    BlocProvider.of<CategoryCubit>(context).fetchAllCategory();
    BlocProvider.of<GetAllStoresCubit>(context).getAllStores();
  }
}
