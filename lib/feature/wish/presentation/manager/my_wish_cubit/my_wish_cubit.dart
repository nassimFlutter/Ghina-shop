import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/wish/data/models/my_wish_model.dart';
import 'package:best_price/feature/wish/data/repo/wish_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'my_wish_state.dart';

class MyWishCubit extends Cubit<MyWishState> {
  MyWishCubit() : super(MyWishInitial());
  MyWishModel myWishModel = MyWishModel();
  static MyWishCubit get(context) => BlocProvider.of(context);
  Future<void> getMyWish() async {
    emit(MyWishLoading());
    var result = await getIt.get<WishRepo>().getMyWish();
    result.fold((error) {
      emit(MyWishFailures(errMessage: error.errMassage));
    }, (allMyWish) {
      myWishModel = allMyWish;
      emit(MyWishSuccess());
    });
  }
}
