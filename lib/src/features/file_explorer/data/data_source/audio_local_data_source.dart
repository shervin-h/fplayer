import 'package:fplayer/src/features/file_explorer/data/models/audio_file_model.dart';

abstract class AudioLocalDataSource {
  Future<List<AudioFileModel>> queryAudioFiles();
}