import 'package:best_price/feature/home/data/models/home_model.dart';
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
    "Price(low to hight)",
  ];
  List<String> sortByQuery = [
    "alpha_asc",
    "alpha_desc",
    "price_desc",
    "price_asc",
  ];
  String? pageTypeForFilter;

  // List<Brand> brandsList = [
  //   Brand(
  //     id: -1,
  //     name: "All",
  //   ),
  // ];

  void setPage(String? pageTypeForFilter) {
    this.pageTypeForFilter = pageTypeForFilter;
  }

  // List<Brand> selectedBrandsList = [];
  // void setBrandList(List<Brand> brandList) {
  //   for (var element in brandList) {
  //     brandsList.add(Brand(
  //       createdAt: element.createdAt,
  //       featured: element.featured,
  //       id: element.id,
  //       image: element.image,
  //       name: element.name,
  //       status: element.status,
  //     ));
  //   }
  // brandsList = brandList;
  // brandsList.insert(
  //   0,
  //   Brand(
  //     id: -1,
  //     name: "All",
  //   ),
  // );

  // brandsList.addAll(List.from(brandList));
  // brandsList[2].name = "jjj";
  // }

  List<Category> categoryList = [
    Category(
      id: -1,
      name: "all",
    ),
  ];
  void setCategoryList(List<Category> categoryList) {
    for (var element in categoryList) {
      this.categoryList.add(Category(
            id: element.id,
            image: element.image,
            name: element.name,
          ));
    }
  }

  // List<String> categoryListSleeted = [];
  int maxPrice = 0;
  int minPrice = 0;
  void setMaxPrice({required int maxPrice}) {
    this.maxPrice = maxPrice;
  }

  void changeSliderValue({required int maxPrice, required int minPrice}) {
    this.maxPrice = maxPrice;
    this.minPrice = minPrice;
    emit(SliderChange());
  }

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

  // void selectBrand(int index) {
  //   if (index == 0) {
  //     for (var element in brandsList) {
  //       element.isSelected = true;
  //     }
  //   } else {
  //     brandsList[index].isSelected = true;
  //   }
  //   // if (index == 0) {
  //   //   selectedBrandsList =
  //   //       brandsList.where((element) => element.id != -1).toList();
  //   // } else {
  //   //   selectedBrandsList.add(brandsList[index]);
  //   // }
  //   emit(BrandsChange());
  // }

  // void deselectBrand(int index) {
  //   if (index == 0) {
  //     for (var element in brandsList) {
  //       element.isSelected = false;
  //     }
  //   } else {
  //     brandsList[0].isSelected = false;
  //     brandsList[index].isSelected = false;
  //   }
  //   // if (index == 0) {
  //   //   selectedBrandsList.clear();
  //   // } else {
  //   //   selectedBrandsList
  //   //       .removeWhere((element) => element.id == brandsList[index].id);
  //   // }
  //   emit(BrandsChange());
  // }

  void selectCategory(int index) {
    if (index == 0) {
      for (var element in categoryList) {
        element.isSelected = true;
      }
    } else {
      categoryList[index].isSelected = true;
    }
    emit(CategoryChange());
  }

  void deselectCategory(int index) {
    if (index == 0) {
      for (var element in categoryList) {
        element.isSelected = false;
      }
    } else {
      categoryList[0].isSelected = false;
      categoryList[index].isSelected = false;
    }
    emit(CategoryChange());
  }

  String? filterQuery(int realMaxPrice) {
    List<String> query = [];
    //? add sort type query -------------
    if (groupValueSort != -1) {
      query.add("sorting_type=${sortByQuery[groupValueSort]}");
    }
    //? -----------------------------------

    //? add brand query---------------------
    List<int> ids = [];
    // for (var i = 1; i < brandsList.length; i++) {
    //   if (brandsList[i].isSelected) {
    //     ids.add(brandsList[i].id ?? -1);
    //   }
    // }
    String brandIdQuery = "";
    for (var i = 0; i < ids.length; i++) {
      if (i < ids.length - 1) {
        brandIdQuery += "${ids[i]},";
      } else {
        brandIdQuery += "${ids[i]}";
      }
    }
    if (ids.isNotEmpty) {
      query.add("brand_id=$brandIdQuery");
    }
    //? price query query---------------------
    if (realMaxPrice != maxPrice) {
      query.add("max_price=$maxPrice");
    }
    if (minPrice > 0) {
      query.add("min_price=$minPrice");
    }
    //? -----------------------------------
    ids.clear();
    //? add category query---------------------
    String categoryIdQuery = "";
    for (var i = 1; i < categoryList.length; i++) {
      if (categoryList[i].isSelected) {
        ids.add(categoryList[i].id ?? -1);
      }
    }
    for (var i = 0; i < ids.length; i++) {
      if (i < ids.length - 1) {
        categoryIdQuery += "${ids[i]},";
      } else {
        categoryIdQuery += "${ids[i]}";
      }
    }
    if (ids.isNotEmpty) {
      query.add("category_id=$categoryIdQuery");
    }
    //? -----------------------------------
    String? finalQuery;

    if (query.isNotEmpty) {
      finalQuery = "?page=$pageTypeForFilter&";
    }
    for (var i = 0; i < query.length; i++) {
      finalQuery = finalQuery! + query[i];
      if (i != query.length - 1) {
        finalQuery += "&";
      }
    }
    return finalQuery;
  }

  void resetAllControllers(int realMaxPrice) {
    // for (var element in brandsList) {
    //   element.isSelected = false;
    // }
    for (var element in categoryList) {
      element.isSelected = false;
    }
    groupValueSort = -1;
    minPrice = 0;
    maxPrice = realMaxPrice;
    emit(ResetChange());
  }
}
