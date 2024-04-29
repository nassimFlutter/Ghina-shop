import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/cart/data/models/cart_model.dart';
import 'package:best_price/feature/cart/data/repos/cart_repo/cart_repo.dart';
import 'package:best_price/feature/cart/presentation/manager/change_quantity_cubit/change_quantity_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'my_cart_state.dart';

class MyCartCubit extends Cubit<MyCartState> {
  MyCartCubit() : super(MyCartInitial());
  static MyCartCubit get(context) => BlocProvider.of(context);
  CartModel myCart = CartModel();
  Future<void> getMyCart(BuildContext context) async {
    emit(MyCartLoading());
    var result = await getIt.get<CartRepo>().getMyCart();
    result.fold((error) {
      emit(MyCartFailures(errMessage: error.errMassage));
    }, (fetchMyCart) {
      myCart = fetchMyCart;
      BlocProvider.of<ChangeQuantityCubit>(context)
          .initializeTextEditingControllers(myCart.myCart ?? []);
     
      emit(MyCartSuccess());
    });
  }
}
