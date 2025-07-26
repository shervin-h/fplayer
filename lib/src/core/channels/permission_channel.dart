import 'package:flutter/services.dart';
import 'package:fplayer/src/core/extensions/string_extensions.dart';

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
      print('Permission result: $result');
      return result.isGranted();
    } on PlatformException catch (e) {
      print('Failed to get Storage permission: ${e.message}');
    } catch (e) {
      print('Failed to get Storage permission - ${e.toString()}');
    }
    return false;
  }

  Future<bool> _requestCameraPermission() async {
    try {
      final result = await _permissionChannel.invokeMethod<String>('requestCameraPermission');
      print('Permission result: $result');
      return result.isGranted();
    } on PlatformException catch (e) {
      print('Failed to get Camera permission: ${e.message}');
    } catch (e) {
      print('Failed to get Camera permission - ${e.toString()}');
    }
    return false;
  }

  Future<bool> _requestSmsPermission() async {
    try {
      final result = await _permissionChannel.invokeMethod<String>('requestSmsPermission');
      print('Permission result: $result');
      return result.isGranted();
    } on PlatformException catch (e) {
      print('Failed to get SMS permission: ${e.message}');
    } catch (e) {
      print('Failed to get SMS permission - ${e.toString()}');
    }
    return false;
  }
}

enum PermissionType {
  storage,
  camera,
  sms,
}
