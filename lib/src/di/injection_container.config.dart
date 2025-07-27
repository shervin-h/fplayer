// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/file_explorer/data/data_source/audio_local_data_source.dart'
    as _i1021;
import '../features/file_explorer/data/data_source/audio_local_data_source_impl.dart'
    as _i673;
import '../features/file_explorer/data/repositories/audio_repository_impl.dart'
    as _i602;
import '../features/file_explorer/domain/repositories/audio_repository.dart'
    as _i188;
import '../features/file_explorer/domain/usecases/get_audios_usecase.dart'
    as _i918;
import '../features/file_explorer/presentation/blocs/file_explorer_bloc.dart'
    as _i272;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1021.AudioLocalDataSource>(
        () => _i673.AudioLocalDataSourceImpl());
    gh.factory<_i188.AudioRepository>(
        () => _i602.AudioRepositoryImpl(gh<_i1021.AudioLocalDataSource>()));
    gh.factory<_i918.GetAudiosUseCase>(
        () => _i918.GetAudiosUseCase(gh<_i188.AudioRepository>()));
    gh.factory<_i272.FileExplorerBloc>(
        () => _i272.FileExplorerBloc(gh<_i918.GetAudiosUseCase>()));
    return this;
  }
}
