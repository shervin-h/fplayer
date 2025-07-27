import 'package:bloc/bloc.dart';

import 'logger_service.dart';

class AppBlocObserver extends BlocObserver {

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    LoggerService.debug('Create: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    LoggerService.debug('Change: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    LoggerService.debug('Close: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    LoggerService.debug('Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    LoggerService.info('Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    LoggerService.error('Error in ${bloc.runtimeType}: $error', stackTrace: stackTrace);
  }
}