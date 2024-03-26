import 'package:best_price/core/utils/logger.dart';
import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    LoggerHelper.info('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    LoggerHelper.debug('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    LoggerHelper.error('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    LoggerHelper.info('onClose -- ${bloc.runtimeType}');
  }
}
