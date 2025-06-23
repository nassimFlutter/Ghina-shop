import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/logger.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/model/pruduct_details_model.dart';
import '../../../data/repo/product_details_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.id) : super(ProductDetailsInitial()) {
    quantityController = TextEditingController(text: quantity.toString());
    getProductDetails(id);
  }

  final int id;
  static ProductDetailsCubit get(context) => BlocProvider.of(context);
  ProductDetailsModel productDetailsModel = const ProductDetailsModel();
  late TextEditingController quantityController;

  Future<void> getProductDetails(int id) async {
    emit(ProductDetailsCubitLoading());
    var result = await getIt.get<ProductDetailsRepo>().getProductDetails(id);
    result.fold((error) {
      LoggerHelper.error(error.errMassage, error.statusCode);
      emit(ProductDetailsCubitFailure(errMessage: error.errMassage));
    }, (getHomePageSuccess) {
      productDetailsModel = getHomePageSuccess;
      // productDetailsModel.data?.images?.add(const Images(
      //     image:
      //         "https://drive.google.com/file/d/10pPaPxrVe4q8oeEOZJVBBD_YtpcInJoe/view?usp=sharing",
      //     type: 11));
      emit(ProductDetailsCubitSuccess());
    });
  }

  int indexImagesDetails = 0;

  onChangeIndexImages(int index) {
    indexImagesDetails = index;
    emit(IndexChanges());
  }

  int colorId = 0;
  setColor(int id) {
    colorId = id;
    emit(IndexChanges());
  }

  int sizeId = 0;
  setSize(int id) {
    sizeId = id;
    emit(IndexChanges());
  }

  int quantity = 01;
  int quantityData = 1;

  // bool checkIfSizeAndColorExist(
  //     int sizeId, int colorId, List<Variant>? variants) {
  //   if (colorId == 0 || sizeId == 0) {
  //     return true;
  //   }

  //   for (var variant in variants!) {
  //     if (variant.sizeId == sizeId && variant.colorId == colorId) {
  //       quantityData = variant.quantity!;
  //       return true;
  //     }
  //   }

  //   return false;
  // }
  void plusQuantity() {
    quantity++;
    quantityController.text = quantity.toString();
    emit(IndexChanges());
  }

  void minQuantity() {
    if (quantity > 1) {
      quantity--;
      quantityController.text = quantity.toString();
    }
    emit(IndexChanges());
  }

  void setQuantity(int value) {
    quantity = value;
    quantityController.text = value.toString();
    emit(IndexChanges());
  }
}
