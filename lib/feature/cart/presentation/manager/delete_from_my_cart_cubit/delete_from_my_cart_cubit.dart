import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_from_my_cart_state.dart';

class DeleteFromMyCartCubit extends Cubit<DeleteFromMyCartState> {
  DeleteFromMyCartCubit() : super(DeleteFromMyCartInitial());
}
