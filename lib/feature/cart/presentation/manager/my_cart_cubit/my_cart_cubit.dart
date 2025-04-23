import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/cart/data/models/cart_model.dart';
import 'package:best_price/feature/cart/data/repos/cart_repo/cart_repo.dart';
import 'package:best_price/feature/cart/presentation/manager/change_quantity_cubit/change_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_cart_state.dart';

class MyCartCubit extends Cubit<MyCartState> {
  MyCartCubit() : super(MyCartInitial());
  static MyCartCubit get(context) => BlocProvider.of(context);
  CartModel myCart = const CartModel();
  void updateCartItemQuantity(String itemId, int newQuantity) {
    final cartItems = myCart.data?.result?.myCart ?? [];
    final itemIndex =
        cartItems.indexWhere((item) => item.id.toString() == itemId);
    if (itemIndex != -1) {
      final updatedItem = cartItems[itemIndex].copyWith(quantity: newQuantity);
      cartItems[itemIndex] = updatedItem;

      // Recreate the Result and Data layers too to maintain immutability
      final updatedResult =
          myCart.data!.result!.copyWith(myCart: List.from(cartItems));
      final updatedData = myCart.data!.copyWith(result: updatedResult);
      myCart = myCart.copyWith(data: updatedData);

      _recalculateTotal();
      emit(MyCartSuccess());
    }
  }

  void _recalculateTotal() {
    double total = 0.0;
    final cartItems = myCart.data?.result?.myCart ?? [];

    for (var item in cartItems) {
      final price = item.product?.discountPrice ?? item.product?.price ?? 0.0;
      total += price * (item.quantity ?? 0);
    }

    final updatedResult =
        myCart.data!.result!.copyWith(totalFinally: total.toInt());
    final updatedData = myCart.data!.copyWith(result: updatedResult);
    myCart = myCart.copyWith(data: updatedData);
  }

  Future<void> getMyCart(BuildContext context) async {
    emit(MyCartLoading());
    var result = await getIt.get<CartRepo>().getMyCart();
    result.fold((error) {
      print(error.errMassage);
      emit(MyCartFailures(errMessage: error.errMassage));
    }, (fetchMyCart) {
      myCart = fetchMyCart;
      BlocProvider.of<ChangeQuantityCubit>(context)
          .initializeTextEditingControllers(myCart.data?.result?.myCart ?? []);

      emit(MyCartSuccess());
    });
  }
}
