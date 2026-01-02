import 'package:dio/dio.dart';

class GraphqlErrorHandler implements Exception {
  final String message;

  GraphqlErrorHandler(this.message);

  @override
  String toString() => message;

  static GraphqlErrorHandler handle(DioException error) {
    String errorDescription = "";
    switch (error.type) {
      case DioExceptionType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        errorDescription =
            "Received invalid status code: ${error.response?.statusCode}";
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        if (error.error.toString().contains("SocketException")) {
          errorDescription = 'No Internet Connection';
        } else {
          errorDescription = "Unexpected error occurred";
        }
        break;
      default:
        errorDescription = "Something went wrong";
    }
    return GraphqlErrorHandler(errorDescription);
  }
}
