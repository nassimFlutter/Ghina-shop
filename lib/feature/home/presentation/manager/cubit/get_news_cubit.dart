import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/home/data/home_repo/home_repo.dart';
import 'package:best_price/feature/home/data/models/news_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit() : super(GetNewsInitial());

  Future<void> getAllNews() async {
    emit(GetNewsLoading());
    var result = await getIt.get<HomeRepo>().getNewsApi();
    result.fold(
      (error) {
        emit(GetNewsFailures(error: error));
      },
      (news) {
        emit(GetNewsSuccess(allNews: news));
      },
    );
  }
}
