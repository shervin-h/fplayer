import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fplayer/src/core/extensions/context_extensions.dart';
import 'package:fplayer/src/core/extensions/string_extensions.dart';
import 'package:fplayer/src/core/presentation/blocs/selected_audio_cubit.dart';
import 'package:fplayer/src/features/file_explorer/presentation/blocs/file_explorer_bloc.dart';
import 'package:fplayer/src/routing/app_route_name.dart';
import 'package:go_router/go_router.dart';

class SongSection extends StatefulWidget {
  const SongSection({super.key});

  @override
  State<SongSection> createState() => _SongSectionState();
}

class _SongSectionState extends State<SongSection> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<FileExplorerBloc, FileExplorerState>(
      builder: (context, state) {
        if (state is FileExplorerLoading) {
          return Center(child: CupertinoActivityIndicator());
        }
        if (state is FileExplorerError) {
          return Center(child: Text(state.message));
        }
        if (state is FileExplorerCompleted) {
          final audios = state.audios;
          return ListView.builder(
            padding: EdgeInsetsDirectional.only(start: 8, end: 8),
            itemCount: audios.length,
            itemBuilder: (context, index) {
              final audio = audios[index];
              return ListTile(
                onTap: () {
                  context.read<SelectedAudioCubit>().select(audio);
                  context.push(AppRouteName.player.asPath());
                },
                leading: audio.cover.isNotEmpty
                    // Image.memory(base64Decode(audio.cover), fit: BoxFit.cover, width: 50, height: 50)
                    ? Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(image: MemoryImage(base64Decode(audio.cover)), fit: BoxFit.cover),
                        ),
                      )
                    : Icon(Icons.audiotrack, color: context.error2()),
                title: Text(
                  audio.title,
                  style: context.body1Bold()!.copyWith(color: context.text1()),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  '${audio.artist} - ${audio.album}',
                  style: context.body2Medium()!.copyWith(color: context.text3()),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
