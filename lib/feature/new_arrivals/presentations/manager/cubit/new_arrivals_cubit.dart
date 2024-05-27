import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/flitter_sort/data/repo/filter_repo.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/new_arrivals/data/repo/new_arrivals_repo/new_arrivals_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'new_arrivals_state.dart';

class NewArrivalsCubit extends Cubit<NewArrivalsState> {
  NewArrivalsCubit() : super(NewArrivalsInitial());
  static NewArrivalsCubit get(context) => BlocProvider.of(context);
  List<Product> allNewArrivalsProducts = [];
  num maxProductPrice = 0;

  Future<void> getAllNewArrivalsProducts() async {
    emit(NewArrivalsLoading());
    var result =
        await getIt.get<NewArrivalsProductsRepo>().getNewArrivalsProducts();

    result.fold((error) {
      emit(NewArrivalsFailure(errMessage: error.errMassage));
    }, (fetchedAllNewArrivals) {
      allNewArrivalsProducts = fetchedAllNewArrivals.value1;
      maxProductPrice = fetchedAllNewArrivals.value2;
      emit(NewArrivalsSuccess());
    });
  }

  Future<void> getNewArrivalsAfterFilter(String query) async {
    emit(NewArrivalsLoading());
    var result = await getIt.get<FilterRepo>().postFilter(query: query);

    result.fold((error) {
      emit(NewArrivalsFailure(errMessage: error.errMassage));
    }, (fetchedAllNewArrivals) {
      allNewArrivalsProducts = fetchedAllNewArrivals;
      emit(NewArrivalsSuccess());
    });
  }
}
