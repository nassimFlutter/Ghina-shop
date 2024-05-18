  import 'package:best_price/core/utils/logger.dart';
  import 'package:best_price/core/utils/service_locator.dart';
  import 'package:best_price/feature/account/data/models/area_model/area_model.dart';
  import 'package:best_price/feature/account/data/repo/area_repo/area_repo.dart';
  import 'package:bloc/bloc.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:meta/meta.dart';
  
  part 'area_state.dart';
  
  class AreaCubit extends Cubit<AreaState> {
    AreaCubit() : super(AreaInitial());
    static AreaCubit get(context) => BlocProvider.of(context);
    List<Item> allAreas = [];
    Item? selectAreaDropDown;
    int? selectedAreaId;
  
    Future<void> getAllArea() async {
      emit(AreaLoading());
      var result = await getIt.get<AreaRepo>().getAllArea();
      result.fold((error) {
        LoggerHelper.error(error.errMassage);
        emit(AreaFailures(errMessage: error.errMassage));
      }, (getAllAreas) {
        allAreas = getAllAreas;
        emit(AreaSuccess());
      });
    }
  }
