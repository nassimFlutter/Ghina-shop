import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/order_model/order_model.dart';
import 'package:best_price/feature/account/data/repo/order_repo/order_repo.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  OrderModel orderModel = const OrderModel();
  static OrderCubit get(context) => BlocProvider.of(context);
  Future<void> getAllMyOrder() async {
    emit(OrderLoading());
    Either<Failure, OrderModel> result =
        await getIt.get<OrderRepo>().getAllMyOrder();
    result.fold((error) {
      // print(error.errMassage);
      emit(OrderFailures(errMessage: error.errMassage));
    }, (getOrder) {
      orderModel = getOrder;
      emit(OrderSuccess());
    });
  }

  String getOrderStatusText(int status, context) {
    switch (status) {
      case 0:
        return S.of(context).pending;
      case 1:
        return S.of(context).ordered;
      case 2:
        return S.of(context).underDelivery;
      case 3:
        return S.of(context).delivered;
      case 4:
        return S.of(context).Cancelled;
      default:
        return S.of(context).unknown;
    }
  }

  Color getOrderStatusColor(int status) {
    switch (status) {
      case 0:
        return Colors.purpleAccent;
      case 1:
        return Colors.black;
      case 2:
        return AppColor.buddhaGold;
      case 3:
        return AppColor.green;
      case 4:
        return Colors.red;
      default:
        return AppColor.green;
    }
  }
}
