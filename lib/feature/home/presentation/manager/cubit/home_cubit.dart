import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/home/data/home_repo/home_repo.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<String> imageList = [
    IconsPath.laptopIcon,
    IconsPath.mobileIcon,
    IconsPath.headphonesIcon,
  ];
  List<String> categoryTitleList = ["Computer", "Phone", "Accessories"];
  List<Product> featuredProductsList = [];
  List<Product> bestSellerProductsList = [];
  List<Product> newstProductsList = [];
  List<HomeBanner> bannersList = [];
  List<Category> categoriesList = [];

  // HomeApiResponse homeApiResponse = HomeApiResponse();
  Future<void> getHomePage() async {
    emit(HomeCubitLoading());

    var result = await getIt.get<HomeRepo>().getHomePage();
    result.fold(
      (error) {
        LoggerHelper.error(error.errMassage, error.statusCode);
        emit(HomeCubitFailure(
            errMessage: error.errMassage, code: error.statusCode));
      },
      (getHomePageSuccess) {
        // Safety checks for null and empty lists
        featuredProductsList = getHomePageSuccess.data?.featuredProducts ?? [];
        bestSellerProductsList =
            getHomePageSuccess.data?.bestSellerProducts ?? [];
        newstProductsList = getHomePageSuccess.data?.newestProducts ?? [];
        bannersList = getHomePageSuccess.data?.banners ?? [];
        categoriesList = getHomePageSuccess.data?.categories ?? [];

        // If any list is null or empty, you can initialize it here or handle as needed
        if (featuredProductsList.isEmpty) {
          LoggerHelper.warning('Featured Products list is empty');
        }
        if (bestSellerProductsList.isEmpty) {
          LoggerHelper.warning('Best Seller Products list is empty');
        }
        if (newstProductsList.isEmpty) {
          LoggerHelper.warning('Newest Products list is empty');
        }
        if (bannersList.isEmpty) {
          LoggerHelper.warning('Banners list is empty');
        }
        if (categoriesList.isEmpty) {
          LoggerHelper.warning('Categories list is empty');
        }

        emit(HomeCubitSuccess());
      },
    );
  }
}
