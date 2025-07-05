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

  // Pagination variables
  int currentPage = 1;
  bool isLoadingMore = false;
  bool hasMoreData = true;
  final int itemsPerPage = 10;

  // Helper method to remove duplicates from product list
  List<Product> _removeDuplicates(List<Product> products) {
    final Map<int?, Product> uniqueProducts = {};
    int duplicatesFound = 0;

    for (final product in products) {
      if (uniqueProducts.containsKey(product.id)) {
        duplicatesFound++;
        LoggerHelper.info(
            'Duplicate product found: ${product.name} (ID: ${product.id})');
      } else {
        uniqueProducts[product.id] = product;
      }
    }

    if (duplicatesFound > 0) {
      LoggerHelper.info('Removed $duplicatesFound duplicate products');
    }

    return uniqueProducts.values.toList();
  }

  Future<void> fetchProductByCategoryId(int categoryId) async {
    emit(CategoryProductLoading());
    // Reset pagination variables
    currentPage = 1;
    hasMoreData = true;
    isLoadingMore = false;

    var result =
        await getIt.get<CategoryRepo>().getProductByCategoryIdWithPagination(
              categoryId: categoryId,
              page: currentPage,
              limit: itemsPerPage,
            );
    result.fold((error) {
      LoggerHelper.error(error.errMassage);
      emit(CategoryProductFailure(errMessage: error.errMassage));
    }, (fetchedProduct) {
      // Remove duplicates from fetched products
      productCategoryResponse = _removeDuplicates(fetchedProduct);
      searchResult = _removeDuplicates(fetchedProduct);

      // Check if we have more data
      if (fetchedProduct.length < itemsPerPage) {
        hasMoreData = false;
      }

      emit(CategoryProductSuccess());
    });
  }

  Future<void> loadMoreProducts(int categoryId) async {
    if (isLoadingMore || !hasMoreData) return;

    isLoadingMore = true; 
    emit(CategoryProductLoadingMore());

    currentPage++;

    var result =
        await getIt.get<CategoryRepo>().getProductByCategoryIdWithPagination(
              categoryId: categoryId,
              page: currentPage,
              limit: itemsPerPage,
            );

    result.fold((error) {
      LoggerHelper.error(error.errMassage);
      isLoadingMore = false;
      currentPage--; // Revert page increment on error
      emit(CategoryProductFailure(errMessage: error.errMassage));
    }, (newProducts) {
      if (newProducts.isEmpty || newProducts.length < itemsPerPage) {
        hasMoreData = false;
      }

      // Filter out products that are already in the list to prevent duplicates
      final existingIds = productCategoryResponse.map((p) => p.id).toSet();
      final uniqueNewProducts = newProducts
          .where((product) => !existingIds.contains(product.id))
          .toList();

      // Add only unique new products to existing lists
      productCategoryResponse.addAll(uniqueNewProducts);

      // Update search results based on current search query
      if (searchController.text.isEmpty) {
        searchResult.addAll(uniqueNewProducts);
      } else {
        // Filter new unique products based on current search
        final filteredNewProducts = uniqueNewProducts.where((product) {
          final productName = product.name?.toLowerCase();
          final searchQuery = searchController.text.toLowerCase();
          return productName!.contains(searchQuery);
        }).toList();
        searchResult.addAll(filteredNewProducts);
      }

      // Final safety check to ensure no duplicates in final lists
      productCategoryResponse = _removeDuplicates(productCategoryResponse);
      searchResult = _removeDuplicates(searchResult);

      isLoadingMore = false;
      emit(CategoryProductSuccess());
    });
  }

  void searchProductByName(String name) {
    // If the search query is empty, reset the products list to show all products
    if (name.isEmpty) {
      // Reset the products list to the original list (ensure no duplicates)
      searchResult = _removeDuplicates(List.from(productCategoryResponse));
    } else {
      // Perform search and filter products based on the search query
      final filteredProducts = productCategoryResponse.where((product) {
        final productName = product.name?.toLowerCase();
        final searchQuery = name.toLowerCase();
        return productName!.contains(searchQuery);
      }).toList();
      // Ensure no duplicates in search results
      searchResult = _removeDuplicates(filteredProducts);
    }

    emit(CategoryProductSuccess());
  }

  void resetPagination() {
    currentPage = 1;
    hasMoreData = true;
    isLoadingMore = false;
    productCategoryResponse.clear();
    searchResult.clear();
    // Clear search controller if needed
    if (searchController.text.isNotEmpty) {
      searchController.clear();
    }
  }
}
