import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/static_page_model.dart';
import 'package:best_price/feature/account/data/repo/static_page_repo/static_page_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'static_page_state.dart';

class StaticPageCubit extends Cubit<StaticPageState> {
  StaticPageCubit() : super(StaticPageInitial());
 static StaticPageCubit get(context) => BlocProvider.of(context);
  StaticPage staticPage = StaticPage();
  Future<void> getStaticPageById(int pageId) async {
    emit(StaticPageLoading());
    var result = await getIt.get<StaticPageRepo>().getStaticPage(pageId);
    result.fold(
        (error) => {emit(StaticPageFailures(errMessage: error.errMassage))},
        (getStaticPageFetched) {
      staticPage = getStaticPageFetched;
      emit(StaticPageSuccess());
    });
  }
}
