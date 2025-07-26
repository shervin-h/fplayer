import 'dart:io';

import 'package:fplayer/src/core/channels/media_channel.dart';
import 'package:fplayer/src/core/channels/permission_channel.dart';
import 'package:fplayer/src/core/extensions/string_extensions.dart';
import 'package:path_provider/path_provider.dart';

abstract class FileHelper {
  static Future<bool> requestStoragePermission() async => await PermissionChannel.storage.request();

  static Future<Directory?> rootDirectory() async {
    if (await requestStoragePermission()) {
      Directory? dir = await getExternalStorageDirectory();
      if (dir != null) {
        /// /storage/emulated/0/Android/data/shervin.hassanzadeh.dev.flavor/files
        return Directory(dir.path.split('Android')[0]);
      }
    }
    return null;
  }

  static Directory? goBackDirectory(Directory current) {
    try {
      return current.parent;
    } catch (_) {
      return null;
    }
  }

  static List<FileSystemEntity> loadFiles(Directory dir, {bool recursive = false}) {
    try {
      return dir.listSync(recursive: recursive);
    } catch (_) {
      return [];
    }
  }


  static List<Directory> loadDirectories(Directory dir) {
    List<Directory> directories = [];
    try {
      loadFiles(dir).forEach((file) {
        if (FileSystemEntity.isDirectorySync(file.path)) {
          directories.add(Directory(file.path));
        }
      });
    } catch (_) {}
    return directories;
  }

  static List<File> loadAudioFiles(Directory dir) {
    List<File> audios = [];
    try {
      loadFiles(dir).forEach((file) {
        if (file is File && file.path.isAudioFile()) {
          audios.add(file);
        }
      });
    } catch (_) {}
    return audios;
  }

  static Future<List<File>> scanAudiosRecursive(Directory dir) async {
    List<File> audios = [];
    try {
      final files = loadFiles(dir);
      for (final file in files) {
        if (file is File && file.path.isAudioFile()) {
          audios.add(file);
        } else if (file is Directory) {
          audios.addAll(await scanAudiosRecursive(file));
        }
      }
    } catch (_) {}
    return audios;
  }

  static Future<List<Map<String, dynamic>>> queryAudioFiles() async {
    return await MediaChannel.audio.request();
  }
}
