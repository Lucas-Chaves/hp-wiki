import 'response_entity.dart';

abstract class CustomHttpClient {
  Future<ResponseEntity> get({
    required String url,
    Map<String, dynamic>? queryParams,
  });
  Future<dynamic> post();
}
