import 'package:flutter/services.dart';

class MetadataReaderChannel {
  static const _metadataReaderChannel = MethodChannel('fplayer.metadata_reader/channel');

  static Future<Map<String, dynamic>?> getMetadata(String filePath) async {
    try {
      final result = await _metadataReaderChannel.invokeMethod<Map<String, String?>>('getMetadata', {'filePath': filePath});
      return Map<String, dynamic>.from(result ?? {});
    } on PlatformException catch (e) {
      throw Exception("Failed to get metadata: ${e.message}");
    } catch (e) {
      print('Failed to get metadata - ${e.toString()}');
    }
    return null;
  }

  static Future<String?> getCoverBase64(String filePath) async {
    try {
      return await _metadataReaderChannel.invokeMethod<String>('getCover', {'filePath': filePath});
    } on PlatformException catch (e) {
      print("Failed to get metadata: ${e.message}");
    } catch (e) {
      print('Failed to get metadata - ${e.toString()}');
    }
    return null;
  }
}