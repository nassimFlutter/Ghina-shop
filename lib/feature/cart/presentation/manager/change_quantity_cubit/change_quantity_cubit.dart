import 'package:best_price/feature/cart/data/models/cart_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_quantity_state.dart';

class ChangeQuantityCubit extends Cubit<ChangeQuantityState> {
  ChangeQuantityCubit() : super(ChangeQuantityInitial());
  static ChangeQuantityCubit get(context) => BlocProvider.of(context);
  TextEditingController quantityController = TextEditingController(text: '01');
  Map<String, TextEditingController> textEditingControllers = {};
  void initializeTextEditingControllers(List<Product> cartProducts) {
    textEditingControllers.clear();
    for (var product in cartProducts) {
      textEditingControllers[product.id.toString()] =
          TextEditingController(text: '01');
    }
  }
  void incrementQuantity() {
    int currentValue = int.parse(quantityController.text);
    quantityController.text = (currentValue + 1).toString().padLeft(2, '0');
    emit(IncrementQuantitySuccess());
  }

  void decrementQuantity() {
    int currentValue = int.parse(quantityController.text);
    if (currentValue > 0) {
      quantityController.text = (currentValue - 1).toString().padLeft(2, '0');
    }
    emit(DecrementQuantitySuccess());
  }
}
