import 'package:bloc/bloc.dart';
import 'package:fplayer/src/features/file_explorer/data/models/audio_file_model.dart';
import 'package:fplayer/src/features/file_explorer/domain/usecases/get_audios_usecase.dart';
import 'package:fplayer/src/infrastructure/storage/local_data_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'file_explorer_event.dart';
part 'file_explorer_state.dart';

@injectable
class FileExplorerBloc extends Bloc<FileExplorerEvent, FileExplorerState> {
  final GetAudiosUseCase getAudiosUseCase;

  FileExplorerBloc(this.getAudiosUseCase) : super(FileExplorerInitial()) {
    on<QueryAudioFiles>((event, emit) async {
      emit(FileExplorerLoading());
      final result = await getAudiosUseCase();
      if (result is LocalDataSuccess) {
        emit(FileExplorerCompleted(result.data!));
      } else {
        emit(FileExplorerError(result.error!));
      }
    });
  }
}
