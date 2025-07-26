import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatFormUtil {
  static bool get isWeb => kIsWeb;

  static bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  static bool get isDesktop => !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  static bool get isServer => !kIsWeb && (Platform.isLinux || Platform.isWindows);

  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  static bool get isIOS => !kIsWeb && Platform.isIOS;
}
