import 'package:flutter/services.dart';
import 'package:fplayer/src/core/extensions/string_extensions.dart';
import 'package:fplayer/src/core/logger/logger_service.dart';

class PermissionChannel {
  PermissionChannel(this.type);

  final PermissionType type;

  static const _permissionChannel = MethodChannel('fplayer.permission/channel');

  static PermissionChannel get storage => PermissionChannel(PermissionType.storage);

  static PermissionChannel get camera => PermissionChannel(PermissionType.camera);

  static PermissionChannel get sms => PermissionChannel(PermissionType.sms);

  Future<bool> request() {
    return switch (type) {
      PermissionType.storage => _requestStoragePermission(),
      PermissionType.camera => _requestCameraPermission(),
      PermissionType.sms => _requestSmsPermission()
    };
  }

  Future<bool> _requestStoragePermission() async {
    try {
      final result = await _permissionChannel.invokeMethod<String>('requestStoragePermission');
      LoggerService.info('Storage permission result: $result');
      return result.isGranted();
    } on PlatformException catch (e, stackTrace) {
      LoggerService.error('${e.message}', error: e, stackTrace: stackTrace);
    } catch (e, stackTrace) {
      LoggerService.error('${e.runtimeType}', error: e, stackTrace: stackTrace);
    }
    return false;
  }

  Future<bool> _requestCameraPermission() async {
    try {
      final result = await _permissionChannel.invokeMethod<String>('requestCameraPermission');
      LoggerService.info('Camera permission result: $result');
      return result.isGranted();
    } on PlatformException catch (e, stackTrace) {
      LoggerService.error('${e.message}', error: e, stackTrace: stackTrace);
    } catch (e, stackTrace) {
      LoggerService.error('${e.runtimeType}', error: e, stackTrace: stackTrace);
    }
    return false;
  }

  Future<bool> _requestSmsPermission() async {
    try {
      final result = await _permissionChannel.invokeMethod<String>('requestSmsPermission');
      LoggerService.info('SMS permission result: $result');
      return result.isGranted();
    } on PlatformException catch (e, stackTrace) {
      LoggerService.error('${e.message}', error: e, stackTrace: stackTrace);
    } catch (e, stackTrace) {
      LoggerService.error('${e.runtimeType}', error: e, stackTrace: stackTrace);
    }
    return false;
  }
}

enum PermissionType {
  storage,
  camera,
  sms,
}
