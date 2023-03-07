import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../core.dart';

@Injectable(as: CustomHttpClient)
class CustomHttpClientImpl implements CustomHttpClient {
  CustomHttpClientImpl(
    this._dio,
    CustomInterceptor customInterceptor,
  );

  final Dio _dio;

  bool get isDevMode => kDebugMode;

  @override
  Future<ResponseEntity> get({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.get(url, queryParameters: queryParams);
    return ResponseEntity(
      response.data,
      response.statusCode,
      response.statusMessage,
    );
  }

  @override
  Future<dynamic> post() {
    throw UnimplementedError();
  }
}
