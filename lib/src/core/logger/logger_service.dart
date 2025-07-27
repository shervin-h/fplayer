import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    output: null, // Use the default LogOutput (-> send everything to console)
    printer: PrettyPrinter(
      methodCount: 2,
      // Number of method calls to be displayed
      errorMethodCount: 5,
      // Number of method calls if stacktrace is provided
      lineLength: 100,
      // Width of the output
      colors: true,
      // Colorful log messages
      printEmojis: true,
      // Print an emoji for each log message
      // Should each log print contain a timestamp
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static info(dynamic message) => _logger.i(message);

  static warning(dynamic message) => _logger.w(message);

  static error(dynamic message, {DateTime? time, Object? error, StackTrace? stackTrace}) =>
      _logger.e(message, time: time, error: error, stackTrace: stackTrace);

  static debug(dynamic message) => _logger.d(message);
}
