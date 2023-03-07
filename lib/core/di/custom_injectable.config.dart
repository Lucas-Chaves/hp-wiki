// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:harry_potter_app/core/core.dart' as _i7;
import 'package:harry_potter_app/core/http/custom_http_client_impl.dart'
    as _i11;
import 'package:harry_potter_app/core/http/custom_interceptor.dart' as _i3;
import 'package:harry_potter_app/core/http/http.dart' as _i4;
import 'package:harry_potter_app/core/modules/dio_third_module.dart' as _i13;
import 'package:harry_potter_app/src/features/home/bloc/home_bloc.dart' as _i8;
import 'package:harry_potter_app/src/features/home/data/data.dart' as _i6;
import 'package:harry_potter_app/src/features/home/data/data_source/houses_data_source.dart'
    as _i12;
import 'package:harry_potter_app/src/features/home/domain/domain.dart' as _i9;
import 'package:harry_potter_app/src/features/home/domain/use_case/get_all_houses_use_case.dart'
    as _i5;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final httpThirdModule = _$HttpThirdModule();
    gh.factory<_i3.CustomInterceptor>(() => _i3.CustomInterceptor());
    gh.singleton<_i4.CustomInterceptor>(
      httpThirdModule.customInterceptor,
      instanceName: 'Interceptor',
    );
    gh.factory<_i5.GetAllHousesUseCase<List<_i6.HouseModel>, _i7.NoParams>>(
        () => _i5.GetAllHousesUsecaseImpl());
    gh.factory<_i8.HomeBloc>(
        () => _i8.HomeBloc(gh<_i9.GetAllHousesUseCase<dynamic, dynamic>>()));
    gh.factory<String>(
      () => httpThirdModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i10.Dio>(() => httpThirdModule.dio(
          gh<String>(instanceName: 'BaseUrl'),
          gh<_i4.CustomInterceptor>(instanceName: 'Interceptor'),
        ));
    gh.factory<_i7.CustomHttpClient>(() => _i11.CustomHttpClientImpl(
          gh<_i10.Dio>(),
          gh<_i7.CustomInterceptor>(),
        ));
    gh.factory<_i12.HousesDataSource>(
        () => _i12.HousesDataSourceImpl(gh<_i7.CustomHttpClient>()));
    return this;
  }
}

class _$HttpThirdModule extends _i13.HttpThirdModule {}
