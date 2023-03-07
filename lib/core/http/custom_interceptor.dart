import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class CustomInterceptor extends Interceptor {
  bool get isRunDev => kDebugMode;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logRequest(options);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logResponse(response);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _logError(err);
    return super.onError(err, handler);
  }

  void _logRequest(RequestOptions options) {
    if (!isRunDev) return;
    _l('HTTP REQUEST\n'
        'Method: ${options.method}\n'
        'URL: ${options.uri}\n'
        'Response type: ${options.responseType}\n'
        'Headers: ${options.headers}\n'
        'Body: ${options.data}\n'
        'TimeOut: ${options.connectTimeout}');
  }

  void _logResponse(Response response) {
    if (!isRunDev) return;
    _l('\n'
        'HTTP RESPONSE\n'
        '--> Request Information <--\n'
        'Method: ${response.requestOptions.method}\n'
        'URL: ${response.requestOptions.uri}\n'
        'ResponseType: ${response.requestOptions.responseType}\n'
        'Headers: ${response.requestOptions.headers}\n'
        'Body: ${response.requestOptions.data}\n'
        '--> Response Information <--\n'
        'StatusCode: ${response.statusCode}\n'
        'Body: ${response.data}');
  }

  void _logError(DioError error) {
    if (!isRunDev) return;
    _l('HTTP ERROR\n'
        '--> Request Information <--\n'
        'Method: ${error.requestOptions.method}\n'
        'URL: ${error.requestOptions.uri}'
        'ResponseType: ${error.requestOptions.responseType}\n'
        'Headers: ${error.requestOptions.headers}\n'
        'Body: ${error.requestOptions.data}\n'
        '--> ResponseInfo <--');
    if (error.response == null) return;
    _l('StatusCode: ${error.response?.statusCode}\n'
        'Body: ${error.response?.data}\n'
        '--> Error Info <--\n'
        'ErrorType: ${error.type}\n'
        'Body: ${error.error}');
  }

  void _l(String text) {
    Logger().d(text);
  }
}
