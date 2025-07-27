part of 'file_explorer_bloc.dart';

@immutable
sealed class FileExplorerEvent {}

final class QueryAudioFiles extends FileExplorerEvent {}

final class LoadVideoFiles extends FileExplorerEvent {}
