import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/order_model/order_model.dart';
import 'package:best_price/feature/account/data/repo/order_repo/order_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  OrderModel orderModel = OrderModel();
  static OrderCubit get(context) => BlocProvider.of(context);
  Future<void> getAllMyOrder() async {
    emit(OrderLoading());
    var result = await getIt.get<OrderRepo>().getAllMyOrder();
    result.fold((error) {
      emit(OrderFailures(errMessage: error.errMassage));
    }, (getOrder) {
      orderModel = getOrder;
      emit(OrderSuccess());
    });
  }
}
