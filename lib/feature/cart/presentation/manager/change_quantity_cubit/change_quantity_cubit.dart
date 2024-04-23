import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_quantity_state.dart';

class ChangeQuantityCubit extends Cubit<ChangeQuantityState> {
  ChangeQuantityCubit() : super(ChangeQuantityInitial());
  static ChangeQuantityCubit get(context) => BlocProvider.of(context);
  TextEditingController quantityController = TextEditingController(text: '01');
  void incrementQuantity() {
    int currentValue = int.parse(quantityController.text);
    quantityController.text = (currentValue + 1).toString().padLeft(2, '0');
    emit(IncrementQuantitySuccess());
  }
}
