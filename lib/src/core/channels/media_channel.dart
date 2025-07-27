import 'package:flutter/services.dart';
import 'package:fplayer/src/core/logger/logger_service.dart';

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
      final List result = await _mediaChannel.invokeMethod('queryAudioFiles');
      return result.map((e) => Map<String, dynamic>.from(e)).toList();
    } on PlatformException catch (e, stackTrace) {
      LoggerService.error('${e.message}', error: e, stackTrace: stackTrace);
      rethrow;
    } catch (e, stackTrace) {
      LoggerService.error('$e', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> _fetchVideoFiles() async {
    try {
      final List result = await _mediaChannel.invokeMethod('queryVideoFiles');
      return result.map((e) => Map<String, dynamic>.from(e)).toList();
    } on PlatformException catch (e, stackTrace) {
      LoggerService.error('${e.message}', error: e, stackTrace: stackTrace);
      rethrow;
    } catch (e, stackTrace) {
      LoggerService.error('$e', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}

enum MediaType {
  audio,
  video,
}
