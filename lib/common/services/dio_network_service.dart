import 'dart:developer';

import 'package:cinemax/common/constants/app_contant.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DioNetworkService extends GetxService {
  late final Dio _dio;

  DioNetworkService(String baseUrl) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${AppContant.apiKey}',
        },
      ),
    );
  }

  /// Reusable Dio function for API requests
  Future<Response> request(
    String endpoint, {
    required String method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      // Merge custom headers with default headers
      final combinedHeaders = {..._dio.options.headers, ...?headers};
      _dio.options.headers = combinedHeaders;

      // Make the request
      final response = await _dio.request(
        endpoint,
        options: Options(method: method),
        queryParameters: queryParameters,
        data: data,
      );

      return response;
    } on DioException catch (e) {
      log('DioException: ${e.message}');
      rethrow;
    }
  }

  Dio get dio => _dio;
}
