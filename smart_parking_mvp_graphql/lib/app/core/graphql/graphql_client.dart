import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:smart_parking_mvp_graphql/app/core/graphql/graphql_error_handler.dart';
import 'package:smart_parking_mvp_graphql/app/core/utils/logger.dart';

class GraphqlClient with Logger {
  late final dio.Dio _dio;
  late final Connectivity connectivity;

  GraphqlClient._internal();

  static GraphqlClient instance = GraphqlClient._internal();

  factory GraphqlClient() {
    return instance;
  }

  GraphqlClient initialize({required String baseUrl}) {
    _dio = dio.Dio();
    addInterceptor();
    connectivity = Connectivity();
    addBaseOptions(baseUrl: baseUrl);
    return this;
  }

  Future<dio.Response> performQuery({
    required String query,
    Map<String, dynamic>? variables,
  }) async {
    if (await isConnectedToInternet()) {
      try {
        final response = await _dio.post(
          '',
          data: {'query': query, 'variables': variables},
        );
        return response;
      } on dio.DioException catch (e) {
        throw GraphqlErrorHandler.handle(e);
      }
    } else {
      throw Exception('No Internet Connection');
    }
  }

  Future<dio.Response> performMutation({
    required String mutation,
    Map<String, dynamic>? variables,
  }) async {
    if (await isConnectedToInternet()) {
      try {
        final response = await _dio.post(
          '',
          data: {'query': mutation, 'variables': variables},
        );
        return response;
      } on dio.DioException catch (e) {
        throw GraphqlErrorHandler.handle(e);
      }
    } else {
      throw Exception('No Internet Connection');
    }
  }

  Future<bool> isConnectedToInternet() async {
    final List<ConnectivityResult> connectivityResult = await connectivity
        .checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  void addBaseOptions({required String baseUrl}) {
    _dio.options = dio.BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }

  void addInterceptor() {
    _dio.interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (options, handler) {
          logRequest(
            url: options.uri.toString(),
            method: options.method,
            data: options.data,
            headers: options.headers,
          );
          handler.next(options);
        },
        onResponse: (response, handler) {
          logResponse(
            url: response.requestOptions.uri.toString(),
            statusCode: response.statusCode,
            data: response.data,
          );
          handler.next(response);
        },
        onError: (dio.DioException error, handler) async {
          logError(
            url: error.requestOptions.uri.toString(),
            error: error.message,
            statusCode: error.response?.statusCode,
          );
          // Handle 401 etc. similar to original code
          if (error.response?.statusCode == 401) {
            // Handle token expiration
            // Get.offAllNamed(Routes.LOGIN);
          }
          handler.next(error);
        },
      ),
    );
  }

  void setAuthHeader(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
}
