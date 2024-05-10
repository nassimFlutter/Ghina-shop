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
  List<Brand> brandsList = [];

  // HomeApiResponse homeApiResponse = HomeApiResponse();

  Future<void> getHomePage() async {
    emit(HomeCubitLoading());
    var result = await getIt.get<HomeRepo>().getHomePage();
    result.fold((error) {
      LoggerHelper.error(error.errMassage, error.statusCode);
      emit(HomeCubitFailure(errMessage: error.errMassage));
    }, (getHomePageSuccess) {
      // homeApiResponse = getHomePageSuccess;
      featuredProductsList = getHomePageSuccess.item?.featuredProducts ?? [];
      bestSellerProductsList =
          getHomePageSuccess.item?.bestSellerProducts ?? [];
      newstProductsList = getHomePageSuccess.item?.newstProducts ?? [];
      bannersList = getHomePageSuccess.item?.banners ?? [];
      categoriesList = getHomePageSuccess.item?.categories ?? [];
      brandsList = getHomePageSuccess.item?.brands ?? [];
      emit(HomeCubitSuccess());
    });
  }
}
