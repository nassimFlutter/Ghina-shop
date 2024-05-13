import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'flitter_state.dart';

class FlitterCubit extends Cubit<FlitterState> {
  FlitterCubit() : super(FlitterInitial());
  static FlitterCubit get(context) => BlocProvider.of(context);
  int groupValueSort = -1;
  bool brandsIsOpen = false;
  bool categoryIsOpen = false;
  List<String> sortByList = [
    'A-Z',
    'Z-A',
    "Price(hight to low)",
    "Price(low to hight)"
  ];
  List<String> brandsList = [
    'All',
    'Apple',
    "Samsung",
    "Sony",
    "Huawei",
    "Lenovo"
  ];
  List<String> selectedBrandsList = [];
  List<String> categoryList = [
    'All',
    'Computer',
    "Phones",
    "Accessories",
    "Laptop",
    "Printers"
  ];
  List<String> categoryListSleeted = [];
  void changeOpenBrandsOrCategory(
      {required bool isOpen, required bool isBrand}) {
    if (isBrand) {
      brandsIsOpen = isOpen;
    } else {
      categoryIsOpen = isOpen;
    }
    emit(BrandsChange());
  }

  void changeGroupValueSort(int value) {
    groupValueSort = value;
    emit(RadioSortChange());
  }

  void selectBrand(brand) {
    if (brand == 'All') {
      selectedBrandsList = List.from(brandsList);
    }
    selectedBrandsList.add(brand);
    emit(BrandsChange());
  }

  void deselectBrand(brand) {
    if (brand == 'All') {
      selectedBrandsList.clear();
    }
    selectedBrandsList.remove(brand);
    emit(BrandsChange());
  }

  void selectCategory(category) {
    if (category == 'All') {
      categoryListSleeted = List.from(categoryList);
    }
    categoryListSleeted.add(category);
    emit(CategoryChange());
  }

  void deselectCategory(brand) {
    if (brand == 'All') {
      categoryListSleeted.clear();
    }
    categoryListSleeted.remove(brand);
    emit(CategoryChange());
  }
}
