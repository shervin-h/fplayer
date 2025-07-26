import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fplayer/src/core/channels/permission_channel.dart';
import 'package:path_provider/path_provider.dart';

class ExplorerSection extends StatefulWidget {
  const ExplorerSection({super.key});

  @override
  State<ExplorerSection> createState() => _ExplorerSectionState();
}

class _ExplorerSectionState extends State<ExplorerSection> {
  List<FileSystemEntity> _files = [];
  Directory? _currentDir;

  _requestPermissionAndLoadFiles() async {
    if (await PermissionChannel.storage.request()) {
      Directory? dir = await getExternalStorageDirectory();
      if (dir != null) {
        /// /storage/emulated/0/Android/data/shervin.hassanzadeh.dev.flavor/files
        Directory baseDir = Directory(dir.path.split('Android')[0]);
        _loadFiles(baseDir);
      } else {
        print('اجازه دسترسی به فایل‌ها داده نشد');
      }
    }
  }

  void _loadFiles(Directory dir) {
    setState(() {
      _currentDir = dir;
      _files = dir.listSync();
    });
  }

  void _goToDirectory(Directory dir) {
    _loadFiles(dir);
  }

  void _goBack() {
    final parent = _currentDir?.parent;
    if (parent != null) _loadFiles(parent);
  }

  @override
  void initState() {
    super.initState();
    _requestPermissionAndLoadFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentDir?.path ?? 'File Explorer'),
        leading: _currentDir != null && _currentDir!.path != _currentDir!.parent.path
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _goBack,
              )
            : null,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _files.length,
          itemBuilder: (context, index) {
            final file = _files[index];
            final isDir = FileSystemEntity.isDirectorySync(file.path);

            if (isDir) {
              return ListTile(
                leading: const Icon(Icons.folder),
                title: Text(file.path.split('/').last),
                onTap: () => _goToDirectory(Directory(file.path)),
              );
            } else if (file.path.toLowerCase().endsWith(".mp3")) {
              return ListTile(
                leading: const Icon(Icons.music_note),
                title: Text(file.path.split('/').last),
                onTap: () {
                  // رفتن به صفحه پخش
                  Navigator.pushNamed(
                    context,
                    '/player',
                    arguments: file.path,
                  );
                },
              );
            } else {
              return const SizedBox(); // فایل‌های دیگر را نادیده بگیر
            }
          },
        ),
      ),
    );
  }
}
