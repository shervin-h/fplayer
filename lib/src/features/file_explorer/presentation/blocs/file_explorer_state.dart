part of 'file_explorer_bloc.dart';

@immutable
sealed class FileExplorerState {}

final class FileExplorerInitial extends FileExplorerState {}

final class FileExplorerLoading extends FileExplorerState {}

final class FileExplorerCompleted extends FileExplorerState {
  final List<AudioFileModel> audios;

  FileExplorerCompleted(this.audios);
}

final class FileExplorerError extends FileExplorerState {
  final String message;

  FileExplorerError(this.message);
}

enum ExploringAudioFilesStatus {
  initial,
  loading,
  completed,
  error;

  bool get isInitial => this == ExploringAudioFilesStatus.initial;

  bool get isLoading => this == ExploringAudioFilesStatus.loading;

  bool get isCompleted => this == ExploringAudioFilesStatus.completed;

  bool get isError => this == ExploringAudioFilesStatus.error;
}

enum ExploringVideoFilesStatus {
  initial,
  loading,
  completed,
  error;

  bool get isInitial => this == ExploringVideoFilesStatus.initial;

  bool get isLoading => this == ExploringVideoFilesStatus.loading;

  bool get isCompleted => this == ExploringVideoFilesStatus.completed;

  bool get isError => this == ExploringVideoFilesStatus.error;
}
