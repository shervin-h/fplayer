import 'package:fplayer/src/di/injection_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => getIt.init();

T inject<T extends Object>({dynamic param1, dynamic param2}) => getIt.get<T>(param1: param1, param2: param2);

T injectWithNamed<T extends Object>(name) => getIt.get<T>(instanceName: name);

resetWithNamed<T extends Object>(name) => getIt.resetLazySingleton<T>(instanceName: name);

reset<T extends Object>() => getIt.resetLazySingleton<T>();

resetAllServiceLocator() async => await getIt.reset(dispose: true);

resetScopeAllServiceLocator() => getIt.resetScope(dispose: true);

registerToGetIt<T extends Object>(K) => getIt.registerLazySingleton<T>(() => K);
