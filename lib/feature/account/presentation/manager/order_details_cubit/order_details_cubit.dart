import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/orders_details/order_details_model.dart';
import 'package:best_price/feature/account/data/repo/order_details_repo/order_details_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
  static OrderDetailsCubit get(context) => BlocProvider.of(context);
  OrderDetailsModel orderDetailsModel = OrderDetailsModel();
  Future<void> getOrderDetails(int orderId) async {
    emit(OrderDetailsLoading());
    var result = await getIt.get<OrderDetailsRepo>().getOrderDetails(orderId);
    result.fold((error) {
      emit(OrderDetailsFailures(errMessage: error.errMassage));
    }, (theDetails) {
      orderDetailsModel = theDetails;
      emit(OrderDetailsSuccess());
    });
  }
}
