import 'package:best_price/core/utils/service_locator.dart';
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
  Future<void> getAllNewArrivalsProducts() async {
    emit(NewArrivalsLoading());
    var result =
        await getIt.get<NewArrivalsProductsRepo>().getNewArrivalsProducts();

    result.fold((error) {
      emit(NewArrivalsFailure(errMessage: error.errMassage));
    }, (fetchedAllNewArrivals) {
      allNewArrivalsProducts = fetchedAllNewArrivals;
      emit(NewArrivalsSuccess());
    });
  }
}
