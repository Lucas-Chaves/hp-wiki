import 'package:dio/dio.dart';
import 'package:harry_potter_app/core/http/http.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpThirdModule {
  @Named("BaseUrl")
  String get baseUrl => 'https://wizard-world-api.herokuapp.com';

  @singleton
  @Named("Interceptor")
  CustomInterceptor get customInterceptor => CustomInterceptor();

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url,
          @Named("Interceptor") CustomInterceptor interceptor) =>
      Dio(BaseOptions(baseUrl: url))..interceptors.addAll([interceptor]);
}
