import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  /// Factory method to create a ServerFailure from a DioException.
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout. Please try again.");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Request send timeout. Please try again.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Response receive timeout. Please try again.");
      case DioExceptionType.badResponse:
        // If Dio receives a response from the server, but with a bad status code (e.g., 404, 500)
        return ServerFailure._handleStatusCode(e.response?.statusCode);
      case DioExceptionType.cancel:
        return ServerFailure("Request was cancelled.");
      case DioExceptionType.unknown:
        return ServerFailure("An unexpected error occurred. Please try again.");
      default:
        return ServerFailure("An unknown error occurred.");
    }
  }

  // Private helper to handle specific HTTP status codes
  static ServerFailure _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return ServerFailure("Bad request. Please check your input.");
      case 401:
        return ServerFailure("Unauthorized. Please check your credentials.");
      case 403:
        return ServerFailure(
            "Forbidden. You don't have permission to access this resource.");
      case 404:
        return ServerFailure("Resource not found.");
      case 500:
        return ServerFailure("Internal server error. Please try again later.");
      case 503:
        return ServerFailure("Service unavailable. Please try again later.");
      default:
        return ServerFailure("Received invalid status code: $statusCode");
    }
  }
}

class NetworkFailure extends Failure {
  NetworkFailure()
      : super(
            "No internet connection. Please check your connection and try again.");
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure()
      : super("An unexpected error occurred. Please try again.");
}
