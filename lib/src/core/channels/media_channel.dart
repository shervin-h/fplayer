import 'package:flutter/services.dart';

class MediaChannel {
  MediaChannel(this.type);

  final MediaType type;

  static const MethodChannel _mediaChannel = MethodChannel('fplayer.media/channel');

  static MediaChannel get audio => MediaChannel(MediaType.audio);

  static MediaChannel get video => MediaChannel(MediaType.video);

  Future<List<Map<String, dynamic>>> request() {
    return switch (type) {
      MediaType.audio => _fetchAudioFiles(),
      MediaType.video => _fetchVideoFiles(),
    };
  }

  Future<List<Map<String, dynamic>>> _fetchAudioFiles() async {
    try {
      final List result = await _mediaChannel.invokeMethod('getAudioFiles');
      return result.map((e) => Map<String, dynamic>.from(e)).toList();
    } on PlatformException catch (e) {
      print('Failed to load audio files: ${e.message}');
    } catch (e) {
      print('Failed to load audio files');
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> _fetchVideoFiles() async {
    try {
      final List result = await _mediaChannel.invokeMethod('getVideoFiles');
      return result.map((e) => Map<String, dynamic>.from(e)).toList();
    } on PlatformException catch (e) {
      print('Failed to load video files: ${e.message}');
    } catch (e) {
      print('Failed to load video files');
    }
    return [];
  }
}

enum MediaType {
  audio,
  video,
}
