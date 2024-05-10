import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/feature/cart/data/models/cart_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_quantity_state.dart';

class ChangeQuantityCubit extends Cubit<ChangeQuantityState> {
  ChangeQuantityCubit() : super(ChangeQuantityInitial());

  static ChangeQuantityCubit get(context) => BlocProvider.of(context);

  Map<String, TextEditingController> textEditingControllers = {};

  void initializeTextEditingControllers(List<MyCart> cartProducts) {
    textEditingControllers.clear();
    for (var product in cartProducts) {
      textEditingControllers[product.id.toString()] =
          TextEditingController(text: product.quantity.toString());
    }
    emit(InitTextController());
  }

  void incrementQuantity(String itemId) {
    final controller = textEditingControllers[itemId];
    if (controller != null) {
      int currentValue = int.tryParse(controller.text) ?? 0;
      controller.text = (currentValue + 1).toString().padLeft(2, '0');
      emit(IncrementQuantitySuccess());
    } else {
      LoggerHelper.error('TextEditingController for item $itemId not found.');
    }
  }

  void decrementQuantity(String itemId) {
    final controller = textEditingControllers[itemId];
    if (controller != null) {
      int currentValue = int.tryParse(controller.text) ?? 0;
      if (currentValue > 1) {
        controller.text = (currentValue - 1).toString().padLeft(2, '0');
        emit(DecrementQuantitySuccess());
      }
    } else {
      LoggerHelper.error('TextEditingController for item $itemId not found.');
    }
  }
}
