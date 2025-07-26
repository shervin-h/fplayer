import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fplayer/src/core/channels/metadata_reader_channel.dart';
import 'package:fplayer/src/core/extensions/context_extensions.dart';
import 'package:fplayer/src/core/helpers/file_helper.dart';

class SongSection extends StatefulWidget {
  const SongSection({super.key});

  @override
  State<SongSection> createState() => _SongSectionState();
}

class _SongSectionState extends State<SongSection> with AutomaticKeepAliveClientMixin {
  List<Map<String, dynamic>> _audios = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: FileHelper.queryAudioFiles(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _audios = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsetsDirectional.only(start: 8, end: 8),
            itemCount: _audios.length,
            itemBuilder: (context, index) {
              final audio = _audios[index];
              return ListTile(
                onTap: () {},
                leading: CoverImage(
                  path: audio['path'],
                ),
                title: Text(
                  '${audio['title']}',
                  style: context.body1Bold()!.copyWith(color: context.text1()),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  '${audio['artist']} - ${audio['album']}',
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

class CoverImage extends StatelessWidget {
  const CoverImage({this.path, this.size = 50, this.radius = 5, super.key});

  final String? path;
  final double size;
  final double radius;

  Future<String?> _getCoverBase64() async {
    if (path != null) {
      return await MetadataReaderChannel.getCoverBase64(path!);
    }
    return null;
  }

  Future<Uint8List?> _getCoverBytes() async {
    final cover = await _getCoverBase64();
    if (cover != null) {
      return base64Decode(cover);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius)
        ),
        child: path != null
            ? FutureBuilder<Uint8List?>(
                future: _getCoverBytes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Image.memory(snapshot.data!, fit: BoxFit.cover,);
                  }
                  return Icon(Icons.music_note);
                },
              )
            : Icon(Icons.music_note),
      ),
    );
  }
}
