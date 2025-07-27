import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fplayer/src/core/helpers/file_helper.dart';
import 'package:fplayer/src/features/file_explorer/presentation/blocs/file_explorer_bloc.dart';
import 'package:fplayer/src/features/file_explorer/presentation/widgets/album_section.dart';
import 'package:fplayer/src/features/file_explorer/presentation/widgets/artist_section.dart';
import 'package:fplayer/src/features/file_explorer/presentation/widgets/folder_section.dart';
import 'package:fplayer/src/features/file_explorer/presentation/widgets/song_section.dart';
import 'package:fplayer/src/features/file_explorer/presentation/widgets/video_section.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({super.key});

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _requestPermissionAndLoadAudios();
  }

  _requestPermissionAndLoadAudios() {
    Future.delayed(const Duration(seconds: 1), () {
      FileHelper.requestStoragePermission().then((isGranted) {
        if (isGranted) {
            context.read<FileExplorerBloc>().add(QueryAudioFiles());
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBarSection(controller: _tabController),
            TabViewSection(controller: _tabController),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TabBarSection extends StatelessWidget {
  const TabBarSection({required this.controller, super.key});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      onTap: (index) => controller.animateTo(index),
      tabs: [
        Tab(text: 'Songs'),
        Tab(text: 'Videos'),
        Tab(text: 'Artists'),
        Tab(text: 'Albums'),
        Tab(text: 'Folders'),
      ],
    );
  }
}

class TabViewSection extends StatelessWidget {
  const TabViewSection({required this.controller, super.key});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller,
        children: [
          SongSection(),
          VideoSection(),
          ArtistSection(),
          AlbumSection(),
          FolderSection(),
        ],
      ),
    );
  }
}
