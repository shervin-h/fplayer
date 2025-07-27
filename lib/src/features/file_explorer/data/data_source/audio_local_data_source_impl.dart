import 'package:fplayer/src/core/helpers/file_helper.dart';
import 'package:fplayer/src/features/file_explorer/data/data_source/audio_local_data_source.dart';
import 'package:fplayer/src/features/file_explorer/data/models/audio_file_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AudioLocalDataSource)
class AudioLocalDataSourceImpl implements AudioLocalDataSource {
  @override
  Future<List<AudioFileModel>> queryAudioFiles() async {
    List<AudioFileModel> audioFiles = [];
    final audios = await FileHelper.queryAudioFiles();
    if (audios.isNotEmpty) {
      for (final audio in audios) {
        audioFiles.add(AudioFileModel.fromJson(audio));
      }
    }
    return audioFiles;
  }
}
