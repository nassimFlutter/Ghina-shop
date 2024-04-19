import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/best_selling/data/best_selling_repo/best_selling_repo.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'best_selling_state.dart';

class BestSellingCubit extends Cubit<BestSellingState> {
  BestSellingCubit() : super(BestSellingInitial());
  static BestSellingCubit get(context) => BlocProvider.of(context);
  List<Product> allBestSellingProducts = [];
  Future<void> getFeaturedProducts() async {
    emit(BestSellingLoading());
    var result = await getIt.get<BestSellingRepo>().getBestSelling();
    result.fold((error) {
      emit(BestSellingFailure(errMessage: error.errMassage));
    }, (getFeaturedProducts) {
      allBestSellingProducts = getFeaturedProducts;
      emit(BestSellingSuccess());
    });
  }
}
