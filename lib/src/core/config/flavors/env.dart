abstract class Env {
  static late String baseUrl;
  static late String appName;

  static void init({
    required String baseUrlValue,
    required String appNameValue,
  }) {
    baseUrl = baseUrlValue;
    appName = appNameValue;
  }
}
