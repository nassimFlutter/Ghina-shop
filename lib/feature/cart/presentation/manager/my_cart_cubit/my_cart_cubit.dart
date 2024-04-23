import 'package:best_price/feature/cart/data/models/cart_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_cart_state.dart';

class MyCartCubit extends Cubit<MyCartState> {
  MyCartCubit() : super(MyCartInitial());
  CartModel myCart = CartModel();
  Future<void> getMyCart() async {
    emit(MyCartLoading());
    
  }
}
