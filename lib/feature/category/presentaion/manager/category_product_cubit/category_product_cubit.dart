import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/category/data/models/product_categort_mode.dart';
import 'package:best_price/feature/category/data/repo/category_repo.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_product_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  CategoryProductCubit() : super(CategoryProductInitial());
  static CategoryProductCubit get(context) => BlocProvider.of(context);
  List<Product> productCategoryResponse = [];
  List<Product> searchResult = [];
  TextEditingController searchController = TextEditingController();
  Future<void> fetchProductByCategoryId(int categoryId) async {
    emit(CategoryProductLoading());
    var result =
        await getIt.get<CategoryRepo>().getProductByCategoryId(categoryId);
    result.fold((error) {
      LoggerHelper.error(error.errMassage);
      emit(CategoryProductFailure(errMessage: error.errMassage));
    }, (fetchedProduct) {
      productCategoryResponse = fetchedProduct;
      // print(fetchedProduct);
      searchResult = fetchedProduct ?? [];
      emit(CategoryProductSuccess());
    });
  }

  void searchProductByName(String name) {
    // If the search query is empty, reset the products list to show all products
    if (name.isEmpty) {
      // Reset the products list to the original list
      searchResult = productCategoryResponse;
    } else {
      // Perform search and filter products based on the search query
      searchResult = productCategoryResponse.where((product) {
            final productName = product.name?.toLowerCase();
            final searchQuery = name.toLowerCase();
            return productName!.contains(searchQuery);
          }).toList() ??
          [];
    }

    emit(CategoryProductSuccess());
  }
}
