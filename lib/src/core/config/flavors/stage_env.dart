import 'package:fplayer/src/core/config/flavors/env.dart';

abstract class StageEnv {
  static void init() {
    Env.init(
      baseUrlValue: 'https://',
      appNameValue: 'FPlayer (Stage)',
    );
  }
}
