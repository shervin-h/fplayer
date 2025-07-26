import 'env.dart';

class DevEnv {
  static void init() {
    Env.init(
      baseUrlValue: 'https://',
      appNameValue: 'FPlayer (Dev)',
    );
  }
}