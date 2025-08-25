import 'package:bloc/bloc.dart';
import 'package:fplayer/src/features/file_explorer/data/models/audio_file_model.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

part 'selected_audio_state.dart';

@injectable
class SelectedAudioCubit extends Cubit<SelectedAudioState> {
  SelectedAudioCubit() : super(UnselectedState());

  void select(AudioFileModel audio) {
    emit(SelectedState(audio));
  }

  void unselect() {
    emit(UnselectedState());
  }
}
