import 'package:fplayer/src/features/file_explorer/data/models/audio_file_model.dart';
import 'package:fplayer/src/infrastructure/storage/local_data_state.dart';

abstract class AudioRepository {
  Future<LocalDataState<List<AudioFileModel>>> queryAudioFiles();
}
