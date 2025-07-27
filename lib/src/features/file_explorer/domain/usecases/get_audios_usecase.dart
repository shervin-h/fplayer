import 'package:fplayer/src/core/usecases/no_param_usecase.dart';
import 'package:fplayer/src/features/file_explorer/data/models/audio_file_model.dart';
import 'package:fplayer/src/features/file_explorer/domain/repositories/audio_repository.dart';
import 'package:fplayer/src/infrastructure/storage/local_data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAudiosUseCase implements NoParamUseCase<LocalDataState<List<AudioFileModel>>> {
  final AudioRepository audioRepository;

  GetAudiosUseCase(this.audioRepository);

  @override
  Future<LocalDataState<List<AudioFileModel>>> call() {
    return audioRepository.queryAudioFiles();
  }
}
