import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/category/data/models/category_mode.dart';
import 'package:best_price/feature/category/data/repo/category_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
   static CategoryCubit get(context)=> BlocProvider.of(context) ; 
  CategoryResponse categoryResponse = CategoryResponse();
  Future<void> fetchAllCategory() async {
    emit(CategoryLoading());
    var result = await getIt.get<CategoryRepo>().fetchAllCategory();
    result.fold((error) {
      emit(CategoryFailure(errMessage: error.errMassage));
    }, (categoryFetched) {
      categoryResponse = categoryFetched;
      emit(CategorySuccess());
    });
  }
}
