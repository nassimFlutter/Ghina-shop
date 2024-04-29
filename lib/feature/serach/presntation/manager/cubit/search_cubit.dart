import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/serach/data/repo/serach_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List<Product> productSearchResult = [];
  static SearchCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  Future<void> initSearch() async {
    searchController.clear();
    productSearchResult.clear();
    emit(SearchInitial());
  }

  Future<void> searchByName(String searchQuery) async {
    emit(SearchLoading());
    var result = await getIt.get<SearchRepo>().searchByName(searchQuery);
    result.fold((error) {
      LoggerHelper.error(error.errMassage);
      emit(SearchFailures(errMessage: error.errMassage));
    }, (search) {
      productSearchResult = search;
      emit(SearchSuccess());
    });
  }
}
