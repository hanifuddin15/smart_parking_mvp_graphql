import 'dart:developer';

mixin Logger {
  void logRequest({
    required String url,
    required String method,
    dynamic data,
    dynamic headers,
  }) {
    log(
      '--------------------------------------------------------------------------------------------------',
      name: 'Request',
    );
    log('URL: $url', name: 'Request');
    log('Method: $method', name: 'Request');
    log('Headers: $headers', name: 'Request');
    log('Data: $data', name: 'Request');
    log(
      '--------------------------------------------------------------------------------------------------',
      name: 'Request',
    );
  }

  void logResponse({required String url, int? statusCode, dynamic data}) {
    log(
      '--------------------------------------------------------------------------------------------------',
      name: 'Response',
    );
    log('URL: $url', name: 'Response');
    log('Status Code: $statusCode', name: 'Response');
    log('Data: $data', name: 'Response');
    log(
      '--------------------------------------------------------------------------------------------------',
      name: 'Response',
    );
  }

  void logError({required String url, String? error, int? statusCode}) {
    log(
      '--------------------------------------------------------------------------------------------------',
      name: 'Error',
    );
    log('URL: $url', name: 'Error');
    log('Error: $error', name: 'Error');
    log('Status Code: $statusCode', name: 'Error');
    log(
      '--------------------------------------------------------------------------------------------------',
      name: 'Error',
    );
  }
}
