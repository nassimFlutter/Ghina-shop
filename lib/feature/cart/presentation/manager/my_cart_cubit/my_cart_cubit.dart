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
  CartModel myCart = CartModel();
  void updateCartItemQuantity(String itemId, int newQuantity) {
    final cartItems = myCart.myCart ?? [];
    final itemIndex =
        cartItems.indexWhere((item) => item.id.toString() == itemId);
    if (itemIndex != -1) {
      cartItems[itemIndex].quantity = newQuantity;
      _recalculateTotal();
      emit(MyCartSuccess()); // Custom state to trigger rebuild
    }
  }

  void _recalculateTotal() {
    double total = 0.0;
    for (var item in myCart.myCart ?? []) {
      final price = item.product.discountPrice ?? item.product.price ?? 0.0;
      total += price * (item.quantity ?? 0);
    }
    myCart.totalFinally = total;
  }

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
