import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ApiError extends Equatable {
  final String message;
  final String? code;
  final int? httpCode;

  const ApiError(this.message, {this.code, this.httpCode});

  @override
  String toString() => 'ApiError:: message: $message , code: $code';

  @override
  List<Object?> get props => [message, code, httpCode];
}

class InternetError extends ApiError {
  const InternetError(super.message);
}

class ConnectionClosedOnHttpError extends ApiError {
  const ConnectionClosedOnHttpError(super.message, String code) : super(code: code);
}

//errorCode: 33
class InvalidPasswordOrUsername extends ApiError {
  const InvalidPasswordOrUsername(super.message, String? code) : super(code: code);
}

//errorCode: 67 after show login dialog for update session
class SessionExpiredAndRecallService extends ApiError {
  const SessionExpiredAndRecallService(super.message);
}

//errorCode: 67
class SessionExpired extends ApiError {
  const SessionExpired(super.message, String? code) : super(code: code);
}

//errorCode: 151
class UsernameAndPhoneNumberNotMatch extends ApiError {
  const UsernameAndPhoneNumberNotMatch(super.message, String code) : super(code: code);
}

//HttpCode: 400
class BadRequest extends ApiError {
  const BadRequest(super.message, String? code) : super(code: code);
}

//HttpCode: 401
class Unauthorized extends ApiError {
  const Unauthorized(super.message, String? code) : super(code: code);
}

//HttpCode: 403
class Forbidden extends ApiError {
  const Forbidden(super.message, String? code) : super(code: code);
}

//HttpCode: 404
class NotFound extends ApiError {
  const NotFound(super.message) : super(code: '404');
}

//HttpCode: 423
class UnavailableForThisOperation extends ApiError {
  const UnavailableForThisOperation(super.message, String? code) : super(code: code);
}

//HttpCode: 451
class UnavailableForLegalReasons extends ApiError {
  const UnavailableForLegalReasons(super.message, String? code) : super(code: code);
}

//HttpCode: 500
class ServerError extends ApiError {
  const ServerError(super.message, String? code, {super.httpCode}) : super(code: code);
}

//HttpCode: bigger than 500
class InternalServerNotUnavailable extends ApiError {
  const InternalServerNotUnavailable(super.message, String? code, {super.httpCode}) : super(code: code);
}

//HttpCode: 503
class ServiceUnavailable extends ApiError {
  const ServiceUnavailable(super.message, String? code, {super.httpCode}) : super(code: code);
}

//HttpCode: 504
class TimeOutError extends ApiError {
  const TimeOutError(super.message, String? code, {super.httpCode}) : super(code: code);
}

class UncaughtError extends ApiError {
  const UncaughtError(super.message);
}


// ApiError handleDioError({DioException? dioException, Response? response}) {
//   if (_isConnectionClosedOnHttpException(dioException)) {
//     return ConnectionClosedOnHttpError(Strings.serverErrorConnection, PayErrorCodes.httpConnectionClosed.toString());
//   }
//   if (dioException != null && dioException.type == DioExceptionType.connectionTimeout) {
//     return TimeOutError('TimeOut Exception', PayErrorCodes.timeOutErrorCode.toString());
//   }
//
//   if (dioError != null && ((dioError.error is SocketException))) {
//     return const InternetError(Strings.internetError);
//   }
//
//   if (dioError != null && ((dioError.error is SessionExpiredAndRecallService))) {
//     return const SessionExpiredAndRecallService(Strings.internetError);
//   }
//
//   if (response == null) {
//     return const UncaughtError(Strings.serverError);
//   }
//
//   try {
//     var data = response.data;
//
//     if (response.data.containsKey('errorMessage')) {
//       data.putIfAbsent('error_message', () => response.data['errorMessage']);
//     }
//
//     if (response.data.containsKey('errorCode')) {
//       data.putIfAbsent('error_code', () => response.data['errorCode'].toString());
//     }
//
//     if (response.data.containsKey('error_code')) {
//       response.data['error_code'] = response.data['error_code'].toString();
//     }
//
//     final errorModel = ErrorModel.fromJson(data);
//     if (errorModel.code != null && errorModel.code!.isNotEmpty && errorModel.code != 'null') {
//       String code = errorModel.code!;
//       switch (int.parse(code)) {
//         case 33:
//           return InvalidPasswordOrUsername(errorModel.message, code);
//
//         case 67:
//           return SessionExpired(errorModel.message, code);
//         case 151:
//           return UsernameAndPhoneNumberNotMatch(errorModel.message, code);
//       }
//     }
//
//     switch (response.statusCode) {
//       case 400:
//         return BadRequest(errorModel.message, errorModel.code);
//
//       case 401:
//         return Unauthorized(errorModel.message, errorModel.code);
//
//       case 403:
//         return Forbidden(errorModel.message, errorModel.code);
//
//       case 404:
//         return const NotFound(Strings.serverError);
//
//       case 423:
//         return UnavailableForThisOperation(errorModel.message, errorModel.code);
//
//       case 451:
//         return UnavailableForLegalReasons(errorModel.message, errorModel.code);
//
//       case 500:
//         return const ServerError(Strings.serverError, PayErrorCodes.internalServerErrorCode, httpCode: 500);
//
//       case 503:
//         return ServiceUnavailable(errorModel.message, errorModel.code, httpCode: 503);
//
//       case 504:
//         return TimeOutError(errorModel.message, errorModel.code, httpCode: 504);
//
//       default:
//         return UncaughtError(errorModel.message.isNotEmpty && errorModel.message.isPersianCharacter()
//             ? errorModel.message
//             : Strings.serverError);
//     }
//   } catch (e) {
//     if (response.statusCode! > 500) {
//       return const InternalServerNotUnavailable(Strings.serverError, PayErrorCodes.internalServerErrorCode);
//     } else {
//       return const UncaughtError(Strings.serverError);
//     }
//   }
// }
//
// bool _isConnectionClosedOnHttpException(DioError? err) {
//   return err != null &&
//       err.type == DioErrorType.other &&
//       ((err.error is HttpException && err.message.contains('Connection closed before full header was received')));
// }