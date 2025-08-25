part of 'selected_audio_cubit.dart';

@immutable
sealed class SelectedAudioState {}

final class UnselectedState extends SelectedAudioState {}

final class SelectedState extends SelectedAudioState {
  final AudioFileModel audioFileModel;
  SelectedState(this.audioFileModel);
}