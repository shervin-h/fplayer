import 'package:fplayer/src/features/file_explorer/data/data_source/audio_local_data_source.dart';
import 'package:fplayer/src/features/file_explorer/data/models/audio_file_model.dart';
import 'package:fplayer/src/features/file_explorer/domain/repositories/audio_repository.dart';
import 'package:fplayer/src/infrastructure/storage/local_data_state.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AudioRepository)
class AudioRepositoryImpl implements AudioRepository {
  final AudioLocalDataSource audioLocalDataSource;

  AudioRepositoryImpl(this.audioLocalDataSource);

  @override
  Future<LocalDataState<List<AudioFileModel>>> queryAudioFiles() async {
    try {
      final data = await audioLocalDataSource.queryAudioFiles();
      return LocalDataSuccess(data);
    } catch (e) {
      return LocalDataFailed(e.toString());
    }
  }
}
