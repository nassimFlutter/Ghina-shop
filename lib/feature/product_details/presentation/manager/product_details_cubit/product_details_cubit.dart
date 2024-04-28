import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/logger.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/model/pruduct_details_model.dart';
import '../../../data/repo/product_details_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.id) : super(ProductDetailsInitial()) {
    getProductDetails(id);
  }

  final int id;
  static ProductDetailsCubit get(context) => BlocProvider.of(context);
  ProductDetailsModel productDetailsModel = ProductDetailsModel();
  Future<void> getProductDetails(int id) async {
    emit(ProductDetailsCubitLoading());
    var result = await getIt.get<ProductDetailsRepo>().getProductDetails(id);
    result.fold((error) {
      LoggerHelper.error(error.errMassage, error.statusCode);
      emit(ProductDetailsCubitFailure(errMessage: error.errMassage));
    }, (getHomePageSuccess) {
      productDetailsModel = getHomePageSuccess;
      emit(ProductDetailsCubitSuccess());
    });
  }

  int indexImagesDetails = 0;

  onChangeIndexImages(int index) {
    indexImagesDetails = index;
    emit(IndexChanges());
  }
}
