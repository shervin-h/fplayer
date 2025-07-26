import 'dart:ui';

import 'package:fplayer/src/core/extensions/int_extensions.dart';

extension ChangeAlpha on Color {
  toAlpha(int opacity) {
    return withAlpha(opacity.toAlpha());
  }
}
